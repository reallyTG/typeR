library(lmf)


### Name: nfs
### Title: Estimate temporal coefficients of selection assuming no
###   fluctuating selection
### Aliases: nfs

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#Fit model
lmf.1 <- lmf(formula = cbind(recruits, survival) ~ weight + tars,
               age = age, year = year, data = sparrowdata)
#Extract At and at
At <- lmf.1$At
at <- lmf.1$at
#Estimate temporal selection coefficients under the assumption of no
  #fluctuating selection
noflusel <- nfs(At = At, at = at, npar = 3, nyear = 7)
#View output
str(noflusel)
noflusel



