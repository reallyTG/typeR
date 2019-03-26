library(popbio)


### Name: splitA
### Title: Split a projection matrix into separate T and F matrices
### Aliases: splitA
### Keywords: survey

### ** Examples

data(whale)
splitA(whale)
# teasel -fertilitiles in last column
data(teasel)
splitA(teasel, r=1:6, c=6)
# hudsonia - fertilities in first two columns
data(hudsonia)
A<-hudsonia[[1]]
splitA(A, r=1:2)
## example using a logical matrix (if fertilities were in the upper diagonal)
splitA(A, row(A)<col(A))

# survival curves
x<-sapply(hudsonia, function(x) colSums(splitA(x, r=1:2)$T))
matplot2(t(x), legend="bottomright", ylab="Survival", 
main="Hudsonia survival curves")




