library(frm)


### Name: frm
### Title: Fitting Fractional Regression Models
### Aliases: frm

### ** Examples

N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#frm estimation of a logit fractional regression model
frm(y,X,linkfrac="logit")

#frm estimation of the binary logit component of the two-part fractional
#regression model with y=1 as the relevant boundary value
frm(y,X,linkbin="logit",type="2Pbin",inf=1)

#frm estimation of the fractional component of the two-part fractional
#regression model with y=1 as the relevant boundary value and using a
#probit link function
frm(y,X,linkfrac="probit",type="2Pfrac",inf=1)

#frm estimation of both components of a two-part fractional regression model
#with y=1 as the relevant boundary value and using a cloglog binary link
#function and a logit fractional link function
frm(y,X,linkbin="cloglog",linkfrac="logit",type="2P",inf=1)

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.



