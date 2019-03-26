library(lmf)


### Name: lnL.M
### Title: Maximum likelihood function for temporal coefficients of
###   selection
### Aliases: lnL.M

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Extract At and at
At <- lmf.1$At
at <- lmf.1$at
#Estimate D
D <- as.vector(chol((Reduce('+', At) / length(At))))
D <- D[D != 0]
#Estimate loglikelihood
lnL.M(D = D, At = At, at = at, npar = 3, ret.alphas = FALSE)
#Estimate temporal mean selection coefficients
lnL.M(D = D, At = At, at = at, npar = 3, ret.alphas = TRUE)



