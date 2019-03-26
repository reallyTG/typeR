library(lmf)


### Name: atCfn
### Title: Calculate corrected temporal mean coefficients of selection
### Aliases: atCfn

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Extract aM, M, At and at
aM <- lmf.1$aM
M <- lmf.1$M
At <- lmf.1$At
at <- lmf.1$at
#Calculate Best Linear Predictor (BLP)
atCfn(aM = aM, M = M, At = At, at = at)



