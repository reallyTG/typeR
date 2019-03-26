library(psych)


### Name: reverse.code
### Title: Reverse the coding of selected items prior to scale analysis
### Aliases: reverse.code
### Keywords: multivariate

### ** Examples

original <- matrix(sample(6,50,replace=TRUE),10,5)
keys <- c(1,1,-1,-1,1)  #reverse the 3rd and 4th items
new <- reverse.code(keys,original,mini=rep(1,5),maxi=rep(6,5))
original[1:3,]
new[1:3,]



