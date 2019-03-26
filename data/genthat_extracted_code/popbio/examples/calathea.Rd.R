library(popbio)


### Name: calathea
### Title: Projection matrices for a tropical understory herb
### Aliases: calathea
### Keywords: datasets

### ** Examples

data(calathea)
## Single matrix
calathea[[11]]
image2(calathea[[11]], text.cex=.8)
title( paste("Calathea", names(calathea[11])), line=3)

## MEAN matrix (exclude pooled matrix)
mean(calathea[-17])

## all plot 1
calathea[1:4]
## all 1982 matrices 
calathea[ grep("1982", names(calathea)) ]
# OR
# calathea[seq(1,16,4)]
# split(calathea, 1:4)[[1]]

## Growth rates -see Figure 7
x<-sapply(calathea[-17], lambda)
x<-matrix(x, nrow=4, byrow=TRUE, dimnames= list(paste("plot", 1:4), 1982:1985))
x
matplot2(x, type='b', ylab='Growth rate', main='Calathea growth rates')





