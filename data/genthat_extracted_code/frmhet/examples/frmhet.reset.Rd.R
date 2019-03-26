library(frmhet)


### Name: frmhet.reset
### Title: RESET Test for Fractional Regression Models under Neglected
###   Heterogeneity
### Aliases: frmhet.reset

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

Z <- cbind(rnorm(N),rnorm(N),rnorm(N))
dimnames(Z)[[2]] <- c("Z1","Z2","Z3")

y <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))

res <- frmhet(y,X,type="GMMx",table=FALSE)

#LM and Wald versions of the RESET test, based on 1 or 2 fitted powers of xb
frmhet.reset(res,2:3,c("Wald","LM"))

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



