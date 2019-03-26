library(robustfa)


### Name: factorScorePfa
### Title: Factor Analysis by Principal Factor Analysis (PFA)
### Aliases: factorScorePfa
### Keywords: robust

### ** Examples


data(stock611)
R611 = cor(stock611[,3:12]); R611

## covmat is a matrix
fsPfa1 = factorScorePfa(factors = 3, covmat = R611); fsPfa1

## covmat is a list
covx = Cov(stock611[,3:12])
covmat = list(cov = getCov(covx), center = getCenter(covx), n.obs = covx@n.obs)
fsPfa2 = factorScorePfa(factors = 3, cor = TRUE, covmat = covmat); fsPfa2

## fsPfa3 contains scores etc.
fsPfa3 = factorScorePfa(x = stock611[,3:12], factors = 2, 
cor = TRUE, rotation = "varimax", scoresMethod = "regression"); fsPfa3




