library(frmhet)


### Name: frmhet
### Title: Fitting Fractional Regression Models under Unobserved
###   Heterogeneity
### Aliases: frmhet

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

Z <- cbind(rnorm(N),rnorm(N),rnorm(N))
dimnames(Z)[[2]] <- c("Z1","Z2","Z3")

y <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))

#Exogeneity, GMMx estimator
frmhet(y,X,type="GMMx")

#Endogeneity, GMMz estimator
frmhet(y,X,Z,type="GMMz")

#Endogeneity, GMMxv estimator
frmhet(y,X,Z,X[,1],type="GMMxv")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



