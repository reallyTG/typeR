library(PerseusR)


### Name: qualityData<-
### Title: Set quality values of main data frame
### Aliases: qualityData<-

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))),
qualityData=data.frame(quality=c('1', '1', '1')))
value <- data.frame(quality=c('0', '0', '0'))
qualityData(mdata) <- value



