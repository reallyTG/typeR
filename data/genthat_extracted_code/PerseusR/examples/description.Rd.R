library(PerseusR)


### Name: description
### Title: Get column description
### Aliases: description

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))),
description=c('aaa', 'bbb', 'ccc'))
description(mdata)



