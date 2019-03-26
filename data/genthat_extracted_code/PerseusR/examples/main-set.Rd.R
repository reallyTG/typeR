library(PerseusR)


### Name: main<-
### Title: Set main columns
### Aliases: main<-

### ** Examples

mdata <- matrixData(main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(c=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))))
value<-data.frame(c=c(0,0,0), d=c(1,1,1))
main(mdata) <- value



