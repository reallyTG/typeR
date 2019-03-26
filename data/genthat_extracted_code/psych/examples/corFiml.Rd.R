library(psych)


### Name: corFiml
### Title: Find a Full Information Maximum Likelihood (FIML) correlation or
###   covariance matrix from a data matrix with missing data
### Aliases: corFiml
### Keywords: multivariate models

### ** Examples
 
rML <- corFiml(bfi[20:27])
rpw <- cor(bfi[20:27],use="pairwise") 
round(rML - rpw,3)
mp <- corFiml(bfi[20:27],show=TRUE)
mp



