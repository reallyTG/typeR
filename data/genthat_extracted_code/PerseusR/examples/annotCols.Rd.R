library(PerseusR)


### Name: annotCols
### Title: Get annotation columns
### Aliases: annotCols

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))))
annotCols(mdata)



