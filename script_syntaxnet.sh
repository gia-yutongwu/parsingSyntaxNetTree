#!/bin/bash

filename="$1"
while read -r line
do
        name="$line"
        if [[ $name == \>* ]]; then
                echo ${name}
                sentenceArray=($name)
                sentenceLen=${#sentenceArray[@]}
#               echo "New sentence len is " ${sentenceLen}
                ARRAY=()
                for (( j=0; j<${sentenceLen}; j++ ));
                do
                        read -r newLine
                        newLine="$newLine"
#                       echo 'syntaxnet gives us' ${newLine}
                        ARRAY+=(${newLine})
                done

                ARRAYLen==${#ARRAY[@]}
#               echo "ARRAY LEN is" ${ARRAYLen}

                string=''

                for (( k=1; k<${sentenceLen}; k++ ));
                do
                        word=${sentenceArray[$k]}
#                       echo "word we are dealing with is " ${word}
                        for (( n=0; n<${#ARRAY[@]}; n++ ));
                        do
                                ans=${ARRAY[$n]}
#                               echo "ans is " ${ans}
#                               array=($ans)
#                               len=${#array[@]}
#                               for (( i=0; i<${len}; i++ ));
#                               do
                                        if [[ $ans == $word ]]; then
                                                string+="(${ARRAY[$n+1]} ${ARRAY[$n+2]})"
#                                               delete=(${ans})
#                                               ARRAY=( "${ARRAY[@]/$delete}" )
                                                break
                                        else
                                                continue
                                        fi
#                               done
                        done
                done
                echo ${string}
                echo "-----------------------------------"
        fi
done < "$filename"