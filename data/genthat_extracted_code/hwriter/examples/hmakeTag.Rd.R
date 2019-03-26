library(hwriter)


### Name: hmakeTag
### Title: HTML/XML tag formatter
### Aliases: hmakeTag
### Keywords: interface

### ** Examples

## simple call
hmakeTag('a','Centipede',href='http://en.wikipedia.org/wiki/Centipede')

## vectorized calls
hmakeTag('tag',1:10,color='red')
hmakeTag(colors()[1:10],1:10,semantic='color')

## nested calls
hmakeTag('html',hmakeTag('body','Text'),'xml:lang'='en')



