library(PerseusR)


### Name: imputeData
### Title: Get imputation of main data frame
### Aliases: imputeData

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))),
imputeData=data.frame(impute=c('False', 'True', 'False')))
imputeData(mdata)



