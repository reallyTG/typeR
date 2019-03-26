library(complmrob)


### Name: isomLR
### Title: (Inverse) Isometric log-ratio transformation for compositional
###   data
### Aliases: isomLR isomLRinv

### ** Examples

X <- as.matrix(USArrests[ , -3])
# Get the ilr with relative information of the 1st column to the other cols
ilrZ1 <- isomLR(X)
# Get the ilr with relative information of the 2nd column to the other cols
ilrZ2 <- isomLR(X, 2)
isomLRinv(ilrZ1)



