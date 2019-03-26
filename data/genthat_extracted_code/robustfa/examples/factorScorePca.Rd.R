library(robustfa)


### Name: factorScorePca
### Title: Factor Analysis by Principal Component Analysis (PCA)
### Aliases: factorScorePca
### Keywords: robust

### ** Examples


data(stock611)
R611=cor(stock611[,3:12]); R611

## covmat is a matrix
fsPca1=factorScorePca(factors = 3, covmat = R611); fsPca1

## covmat is a list
covx <- Cov(stock611[,3:12])
covmat <- list(cov=getCov(covx), center=getCenter(covx), n.obs=covx@n.obs)
fsPca2=factorScorePca(factors = 3, covmat = covmat); fsPca2

## fsPca3 contains scores etc.
fsPca3=factorScorePca(x = stock611[,3:12], factors = 2, cor = TRUE, rotation = "varimax", 
scoresMethod = "regression"); fsPca3




