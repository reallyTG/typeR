library(frmpd)


### Name: frmpd
### Title: Fitting Panel Data Fractional Regression Models
### Aliases: frmpd

### ** Examples

id <- rep(1:50,each=5)
time <- rep(1:5,50)
NT <- 250

XBu <- rnorm(NT)
y <- exp(XBu)/(1+exp(XBu))

X <- cbind(rnorm(NT),rnorm(NT))
dimnames(X)[[2]] <- c("X1","X2")

Z <- cbind(rnorm(NT),rnorm(NT),rnorm(NT))
dimnames(Z)[[2]] <- c("Z1","Z2","Z3")

# Exogeneity, no lags, no time dummies, clustered standard errors, GMMbgw estimator
frmpd(id,time,y,X,type="GMMbgw")

# Lagged covariates and instruments, robust standard errors, GMMww estimator
frmpd(id,time,y,X,lags=TRUE,type="GMMww",var.type="robust")

# Endogeneity, time dummies, GMMpfe estimator
frmpd(id,time,y,X,Z,x.exogenous=FALSE,type="GMMpfe",tdummies=TRUE)

# Standard errors based on 100 bootstrap samples, QMLcre estimator (not run)
#frmpd(id,time,y,X,Z,X[,1],x.exogenous=FALSE,type="QMLcre",link="probit",bootstrap=TRUE,B=100)

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



