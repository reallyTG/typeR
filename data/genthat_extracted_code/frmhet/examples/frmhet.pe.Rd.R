library(frmhet)


### Name: frmhet.pe
### Title: Fractional Regression Models under Unobserved Heterogeneity -
###   Partial Effects
### Aliases: frmhet.pe

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

Z <- cbind(rnorm(N),rnorm(N),rnorm(N))
dimnames(Z)[[2]] <- c("Z1","Z2","Z3")

y <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))

res <- frmhet(y,X,type="GMMx",table=FALSE)

#Smearing estimator of average partial effects for variable X1
frmhet.pe(res,which.x="X1")

#Naive estimator of conditional partial effects for all covariates,
#which are evaluated at X1=1 and X2=-1
frmhet.pe(res,smearing=FALSE,APE=FALSE,CPE=TRUE,at=c(1,-1))

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



