library(frm)


### Name: frm.ptest
### Title: P Test for Fractional Regression Models
### Aliases: frm.ptest

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#Testing logit versus loglog specifications for standard fractional
#regression models using a LM version of the P test
res1 <- frm(y,X,linkfrac="logit",table=FALSE)
res2 <- frm(y,X,linkfrac="loglog",table=FALSE)
frm.ptest(res1,res2,"LM")

#Testing a logit one-part fractional regression model versus a binary logit +
#fractional probit two-part model using a Wald version of the P test
res1 <- frm(y,X,linkfrac="logit",table=FALSE)
res2 <- frm(y,X,linkbin="logit",linkfrac="probit",type="2P",inf=1,table=FALSE)
frm.ptest(res1,res2,"Wald")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm.



