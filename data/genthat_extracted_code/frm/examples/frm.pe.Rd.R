library(frm)


### Name: frm.pe
### Title: Fractional Regression Models - Partial Effects
### Aliases: frm.pe

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#Computing average partial effects for a logit fractional regression model
res <- frm(y,X,linkfrac="logit",table=FALSE)
frm.pe(res)

#Computing average partial effects for a binary logit + fractional probit
#two-part model
res <- frm(y,X,linkbin="logit",linkfrac="probit",type="2P",inf=1,table=FALSE)
frm.pe(res)

#Computing conditional partial effects for X2 in the logit component
#of a two-part fractional regression model, with the covariates evaluated
#at their median values
res <- frm(y,X,linkfrac="logit",type="2Pfrac",inf=1,table=FALSE)
frm.pe(res,APE=FALSE,CPE=TRUE,at="median",which.x="X2")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



