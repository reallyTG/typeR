library(popbio)


### Name: tortoise
### Title: Projection matrices for desert tortoise
### Aliases: tortoise
### Keywords: datasets

### ** Examples

data(tortoise)
A<-tortoise[["med.high"]]
# log color scale not needed
image2(A, mar=c(1,3.5, 5,1), log=FALSE, box.off=.1)
title("Tortoise projection matrix", line=3)

splitA(A)
lambda(A)
sapply(tortoise, lambda)






