library(poLCA)


### Name: gss82
### Title: 1982 General Social Survey (sample data)
### Aliases: gss82
### Keywords: datasets

### ** Examples

data(gss82)
f <- cbind(PURPOSE,ACCURACY,UNDERSTA,COOPERAT)~1
gss.lc2 <- poLCA(f,gss82,nclass=2) # log-likelihood = -2783.268

# Could also try:
# gss.lc3 <- poLCA(f,gss82,nclass=3,maxiter=3000,nrep=10) # log-likelihood = -2754.545
# gss.lc4 <- poLCA(f,gss82,nclass=4,maxiter=15000,nrep=10,tol=1e-7) # log-likelihood = -2746.621



