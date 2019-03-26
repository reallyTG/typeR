library(frm)


### Name: frm.ggoff
### Title: GGOFF Tests for Fractional Regression Models
### Aliases: frm.ggoff

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#Testing the logit specification of a standard fractional regression model
#using LM and Wald versions of the GGOFF test, based on 1 or 2 fitted powers of
#the linear predictor
res <- frm(y,X,linkfrac="logit",table=FALSE)
frm.ggoff(res,c("Wald","LM"))

#Testing the probit specification of the binary component of a two-part fractional
#regression model using a LR-based GGOFF test
res <- frm(y,X,linkbin="probit",type="2Pbin",inf=1,table=FALSE)
frm.ggoff(res,"LR")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



