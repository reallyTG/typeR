library(eRm)


### Name: LLTM
### Title: Estimation of linear logistic test models
### Aliases: LLTM
### Keywords: models

### ** Examples

#LLTM for 2 measurement points
#100 persons, 2*15 items, W generated automatically
res1 <- LLTM(lltmdat1, mpoints = 2)
res1
summary(res1)

#Reparameterized Rasch model as LLTM (more pasimonious)
W <- matrix(c(1,2,1,3,2,2,2,1,1,1),ncol=2)              #design matrix
res2 <- LLTM(lltmdat2, W = W)
res2
summary(res2)



