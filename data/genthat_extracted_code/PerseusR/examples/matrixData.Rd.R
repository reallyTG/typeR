library(PerseusR)


### Name: matrixData
### Title: matrixData constructor
### Aliases: matrixData

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))),
description=c('aaa', 'bbb', 'ccc'),
imputeData=data.frame(impute=c('False', 'True', 'False')),
qualityData=data.frame(quality=c('0', '1', '0')))



