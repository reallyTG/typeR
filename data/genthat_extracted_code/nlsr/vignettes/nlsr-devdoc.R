## ----c001----------------------------------------------------------------
library(nlsr)
ydat<-c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 50.156, 62.948,
       75.995, 91.972)
tdat<-1:12
# try setting t and y here
t <- tdat
y <- ydat
sol1 <- nlxb(y~100*b1/(1+10*b2*exp(-0.1*b3*t)), start=c(b1=2, b2=5, b3=3))
coef(sol1)
print(coef(sol1))

## ----c002----------------------------------------------------------------
require(nlsr)
newDeriv() # a call with no arguments returns a list of available functions
           # for which derivatives are currently defined
newDeriv(sin(x)) # a call with a function that is in the list of available derivatives
                 # returns the derivative expression for that function
nlsDeriv(~ sin(x+y), "x") # partial derivative of this function w.r.t. "x"

## CAUTION !! ##
newDeriv(joe(x)) # but an undefined function returns NULL
newDeriv(joe(x), deriv=log(x^2)) # We can define derivatives, even if joe(x) is meanin
nlsDeriv(~ joe(x+z), "x")

# Some examples of usage
f <- function(x) x^2
newDeriv(f(x), 2*x*D(x))
nlsDeriv(~ f(abs(x)), "x")
nlsDeriv(~ x^2, "x")
nlsDeriv(~ (abs(x)^2), "x")

# derivatives of distribution functions
nlsDeriv(~ pnorm(x, sd=2, log = TRUE), "x")
# get evaluation code from a formula
codeDeriv(~ pnorm(x, sd = sd, log = TRUE), "x")
# wrap it in a function call
fnDeriv(~ pnorm(x, sd = sd, log = TRUE), "x")
f <- fnDeriv(~ pnorm(x, sd = sd, log = TRUE), "x", args = alist(x =, sd = 2))
f
f(1)
100*(f(1.01) - f(1))  # Should be close to the gradient
                      # The attached gradient attribute (from f(1.01)) is
                      # meaningless after the subtraction.

## ----c003----------------------------------------------------------------
weed <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443,
          38.558, 50.156, 62.948, 75.995, 91.972)
ii <- 1:12
wdf <- data.frame(weed, ii)
wmod <- weed ~ b1/(1+b2*exp(-b3*ii))
start1  <-  c(b1=1, b2=1, b3=1)
wrj <- model2rjfun(wmod, start1, data=wdf)
print(wrj)
weedux <- nlxb(wmod, start=c(b1=200, b2=50, b3=0.3)) 
print(weedux)

wss <- model2ssgrfun(wmod, start1, data=wdf)
print(wss)

# We can get expressions used to calculate these as follows:
wexpr.rj <- modelexpr(wrj) 
print(wexpr.rj)

wexpr.ss <- modelexpr(wss) 
print(wexpr.ss)

wrjdoc <- rjfundoc(wrj)
print(wrjdoc)
# We do not have similar function for ss functions

## ----c004----------------------------------------------------------------
shobbs.res  <-  function(x){ # scaled Hobbs weeds problem -- residual
  # This variant uses looping
  if(length(x) != 3) stop("hobbs.res -- parameter vector n!=3")
  y  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
           38.558, 50.156, 62.948, 75.995, 91.972)
  tt  <-  1:12
  res  <-  100.0*x[1]/(1+x[2]*10.*exp(-0.1*x[3]*tt)) - y
}

shobbs.jac  <-  function(x) { # scaled Hobbs weeds problem -- Jacobian
  jj  <-  matrix(0.0, 12, 3)
  tt  <-  1:12
  yy  <-  exp(-0.1*x[3]*tt)
  zz  <-  100.0/(1+10.*x[2]*yy)
  jj[tt,1]   <-   zz
  jj[tt,2]   <-   -0.1*x[1]*zz*zz*yy
  jj[tt,3]   <-   0.01*x[1]*zz*zz*yy*x[2]*tt
  attr(jj, "gradient") <- jj
  jj
}

cat("try nlfb\n")
st  <-  c(b1=1, b2=1, b3=1)
low  <-  -Inf
up <- Inf
ans1 <- nlfb(st, shobbs.res, shobbs.jac, trace=TRUE)
summary(ans1)

## No jacobian function -- use internal approximation
ans1n <- nlfb(st, shobbs.res, trace=TRUE, control=list(watch=FALSE)) # NO jacfn
summary(ans1n)
## difference
coef(ans1)-coef(ans1n)

## ----c005----------------------------------------------------------------
# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
            38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing
start1  <-  c(b1=1, b2=1, b3=1)
eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))
weeddata1  <-  data.frame(y=ydat, tt=tdat)
anlxb1  <-  try(nlxb(eunsc, start=start1, trace=TRUE, data=weeddata1))
summary(anlxb1)

## ----c006----------------------------------------------------------------
### From examples above
print(weedux)
print(ans1)

## ----c007----------------------------------------------------------------
## Use shobbs example
RG <- resgr(st, shobbs.res, shobbs.jac)
RG
SS <- resss(st, shobbs.res)
SS

## ----c008----------------------------------------------------------------
## nlsSimplify
nlsSimplify(quote(a + 0))
nlsSimplify(quote(exp(1)), verbose = TRUE)

nlsSimplify(quote(sqrt(a + b)))  # standard rule
## sysSimplifications
# creates a new environment whose parent is emptyenv()  Why??
str(sysSimplifications)
myrules <- new.env(parent = sysSimplifications)
## newSimplification
newSimplification(sqrt(a), TRUE, a^0.5, simpEnv = myrules)
nlsSimplify(quote(sqrt(a + b)), simpEnv = myrules)

## isFALSE
print(isFALSE(1==2))
print(isFALSE(2==2))

## isZERO
print(isZERO(0))
x <- -0
print(isZERO(x))
x <- 0
print(isZERO(x))
print(isZERO(~(-1)))
print(isZERO("-1"))
print(isZERO(expression(-1)))


## isONE
print(isONE(1))
x <- 1
print(isONE(x))
print(isONE(~(1)))
print(isONE("1"))
print(isONE(expression(1)))


## isMINUSONE
print(isMINUSONE(-1))
x <- -1
print(isMINUSONE(x))
print(isMINUSONE(~(-1)))
print(isMINUSONE("-1"))
print(isMINUSONE(expression(-1)))

## isCALL  ?? don't have good understanding of this
x <- -1
print(isCALL(x,"isMINUSONE"))
print(isCALL(x, quote(isMINUSONE)))
      
## findSubexprs
findSubexprs(expression(x^2, x-y, y^2-x^2))

## sysDerivs
# creates a new environment whose parent is emptyenv()  Why??
str(sysDerivs)

## ----c009----------------------------------------------------------------
# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
            38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing
start1  <-  c(b1=1, b2=1, b3=1)
eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))
weeddata1  <-  data.frame(y=ydat, tt=tdat)
## The following attempt with nls() fails!
anls1  <-  try(nls(eunsc, start=start1, trace=TRUE, data=weeddata1))
## But we succeed by calling nlxb first.
anlxb1  <-  try(nlxb(eunsc, start=start1, trace=TRUE, data=weeddata1))
st2 <- coef(anlxb1)
anls2  <-  try(nls(eunsc, start=st2, trace=TRUE, data=weeddata1))
## Or we can simply call wrapnlsr
anls2a  <-  try(wrapnlsr(eunsc, start=start1, trace=TRUE, data=weeddata1))

## ----c010----------------------------------------------------------------
Treated <- Puromycin[Puromycin$state == "treated", ]
weighted.MM <- function(resp, conc, Vm, K)
{
  ## Purpose: exactly as white book p. 451 -- RHS for nls()
  ##  Weighted version of Michaelis-Menten model
  ## ----------------------------------------------------------
  ## Arguments: 'y', 'x' and the two parameters (see book)
  ## ----------------------------------------------------------
  ## Author: Martin Maechler, Date: 23 Mar 2001
  
  pred <- (Vm * conc)/(K + conc)
  (resp - pred) / sqrt(pred)
}
## Here is the estimation using predicted value weights
Pur.wtnlspred <- nls( ~ weighted.MM(rate, conc, Vm, K), data = Treated,
               start = list(Vm = 200, K = 0.1))
summary(Pur.wtnlspred)

## nlxb cannot use this form
Pur.wtnlxbpred <- try(nlxb( ~ weighted.MM(rate, conc, Vm, K), data = Treated,
               start = list(Vm = 200, K = 0.1)))
## and the structure is wrong for nlfb. See wres.MM below.
Pur.wtnlfbpred <- try(nlfb(resfn=weighted.MM(rate, conc, Vm, K), data = Treated,
               start = list(Vm = 200, K = 0.1)))



## Now use fixed weights and the weights argument in nls()
Pur.wnls <- nls( rate ~ (Vm * conc)/(K + conc), data = Treated,
                  start = list(Vm = 200, K = 0.1), weights=1/rate)
summary(Pur.wnls)

## nlsr::nlxb should give essentially the same result
library(nlsr)
## Note that we put in the dataframe name to explicitly specify weights
Pur.wnlxb <- nlxb( rate ~ (Vm * conc)/(K + conc), data = Treated,
                start = list(Vm = 200, K = 0.1), weights=1/Treated$rate)
summary(Pur.wnlxb)
## check difference
coef(Pur.wnls) - coef(Pur.wnlxb)
## Residuals Pur.wnls -- These are weighted
## resid(Pur.wnlxb) # ?? does not work -- why?
print(res(Pur.wnlxb))
## Those from nls() are NOT weighted
resid(Pur.wnls)

## Try using a function, that is nlsr::nlfb
stw <- c(Vm = 200, K = 0.1)
wres.MM <- function(prm, rate, conc) {
      Vm <- prm[1]
      K <- prm[2]
      pred <- (Vm * conc)/(K + conc)
    (rate - pred) / sqrt(rate) # NOTE: NOT pred here
}

# test function first to see it works
print(wres.MM(stw, rate=Treated$rate, conc=Treated$conc))

Pur.wnlfb <- nlfb(start=stw,  resfn=wres.MM, rate = Treated$rate, conc=Treated$conc, 
                  trace=FALSE) # Note: weights are inside function already here
summary(Pur.wnlfb)
print(Pur.wnlfb)
## check estimates with nls() result
coef(Pur.wnls) - coef(Pur.wnlfb)
## and with nlxb result
coef(Pur.wnlxb) - coef(Pur.wnlfb)

wres0.MM <- function(prm, rate, conc) {
      Vm <- prm[1]
      K <- prm[2]
      pred <- (Vm * conc)/(K + conc)
    (rate - pred) # NOTE: NO weights
}
Pur.wnlfb0 <- nlfb(start=stw,  resfn=wres0.MM, rate = Treated$rate, conc=Treated$conc, 
                  weights=1/Treated$rate, trace=FALSE) # Note: explicit weights
summary(Pur.wnlfb0)
print(Pur.wnlfb0)
## check estimates with nls() result
coef(Pur.wnls) - coef(Pur.wnlfb0)
## and with nlxb result
coef(Pur.wnlxb) - coef(Pur.wnlfb0)

wss.MM <- function(prm, rate, conc) {
  ss <- as.numeric(crossprod(wres.MM(prm, rate, conc)))
}
library(optimr)
osol <- optimr(stw, fn=wss.MM, gr="grnd", method="Nelder-Mead", control=list(trace=0), 
            rate=Treated$rate, conc=Treated$conc)
print(osol)
## difference from nlxb
osol$par - coef(Pur.wnlxb)

## ----hobbsrestest--------------------------------------------------------
# tryhobbsderiv.R
ydat<-c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 50.156, 62.948,
       75.995, 91.972)
tdat<-1:12
# try setting t and y here
t <- tdat
y <- ydat
# now define a function

hobbs.res<-function(x, t, y){ # Hobbs weeds problem -- residual
  # This variant uses looping
#  if(length(x) != 3) stop("hobbs.res -- parameter vector n!=3")
#  if(abs(12*x[3])>50) {
#    res<-rep(Inf,12)
#  } else {
    res<-x[1]/(1+x[2]*exp(-x[3]*t)) - y
#  }
}
# test it
start1 <- c(200, 50, .3)
## residuals at start1
r1 <- hobbs.res(start1, t=tdat, y=ydat)
print(r1)

## ----hobbnlsr, error=TRUE, warning=TRUE, messages=TRUE-------------------
## NOTE: some functions may be seemingly correct for R, but we do not
## get the result desired, despite no obvious error. Always test.
require(nlsr)
# Try directly to differentiate the residual vector. r1 is numeric, so this should
# return a vector of zeros in a mathematical sense. In fact it gives an error, 
# since R does not want to differentiate a numeric vector.
Jr1a <- fnDeriv(r1, "x")
# Set up a function containing expression with subscripted parameters x[]
hobbs1 <- function(x, t, y){ res<-x[1]/(1+x[2]*exp(-x[3]*t)) - y }
# test the residuals
print(hobbs1(start1, t=tdat, y=ydat))
# Alternatively, let us set up t and y
y<-c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558, 50.156, 62.948,
       75.995, 91.972)
t<-1:12
# try different calls. Note that we need to include t and y data somehow
print(hobbs1(start1))
print(hobbs1(start1, t, y))
print(hobbs1(start1, tdat, ydat))
# We remove t and y, to ensure we don't get results from their presence
rm(t)
rm(y)
# Set up a function containing an expression with named (with numbers) parameters 
# Note that we need to link these to the values in x
hobbs1m <- function(x, t, y){
  x001 <- x[1]
  x002 <- x[2]
  x003 <- x[3]
  res<-x001/(1+x002*exp(-x003*t)) - y 
}
print(hobbs1m(x=start1, t=tdat, y=ydat))
# Function with explicit use of the expression() 
hobbs1me <- function(x, t, y){
  x001 <- x[1]
  x002 <- x[2]
  x003 <- x[3]
  expression(x001/(1+x002*exp(-x003*t)) - y) 
}
print(hobbs1me(start1, t=tdat, y=ydat))
# note failure (because the expression is not evaluated?)
#
# Now try to take derivatives
Jr11m <- fnDeriv(hobbs1m, c("x001", "x002", "x003"))
# fails because expression is INSIDE a function (i.e., closure)
#
# try directly differentiating the expression
Jr11ex <-fnDeriv(expression(x001/(1+x002*exp(-x003*t)) - y)
                  , c("x001", "x002", "x003"))
# this seems to "work". Let us display the result
Jr11ex
# Set the values of the parameters by name
x001 <- start1[1]
x002 <- start1[2]
x003 <- start1[3]
# and try to evaluate
print(eval(Jr11ex))
# we need t and y, so set them
t<-tdat
y<-ydat
print(eval(Jr11ex))
# But there is still a problem. WHY???
#
# Let us try it piece by piece (column by column)
resx <- expression(x001/(1+x002*exp(-x003*t)) - y)
res1 <- Deriv(resx, "x001", do_substitute=FALSE)
res1
col1 <- eval(res1)
res2 <- Deriv(resx, "x002", do_substitute=FALSE)
res2
col2 <- eval(res2)
res3 <- Deriv(resx, "x003", do_substitute=FALSE)
res3
col3 <- eval(res3)
hobJac <- cbind(col1, col2, col3)
print(hobJac)

## ----smallresid----------------------------------------------------------
## test small resid case with roffset
tt <- 1:25
ymod <- 10 * exp(-0.01*tt) + 5
n <- length(tt)
evec0 <- rep(0, n)
evec1 <- 1e-4*runif(n, -.5, .5)
evec2 <-  1e-1*runif(n, -.5, .5)
y0 <- ymod + evec0
y1 <- ymod + evec1
y2 <- ymod + evec2
mydata <- data.frame(tt, y0, y1, y2)
st <- c(aa=1, bb=1, cc=1)

## ----nlsfit0-------------------------------------------------------------
nlsfit0 <-  try(nls(y0 ~ aa * exp(-bb*tt) + cc, start=st, data=mydata, trace=TRUE))
nlsfit0
library(nlsr)
nlsrfit0 <- try(nlxb(y0 ~ aa * exp(-bb*tt) + cc, start=st, data=mydata, trace=FALSE))
nlsrfit0

## ----trf-----------------------------------------------------------------
trf <- function(par, data) {
    tt <- data[,"tt"]
    res <- par["aa"]*exp(-par["bb"]*tt) + par["cc"] - y0
}
print(trf(st, data=mydata))
trj <- function(par, data) {
    tt <- data[,"tt"]
    m <- dim(data)[1]
    JJ <- matrix(NA, nrow=m, ncol=3)
    JJ[,1] <- exp(-par["bb"]*tt)
    JJ[,2] <- - tt * par["aa"] * exp(-par["bb"]*tt)
    JJ[,3] <- 1
    JJ
}
Ja <- trj(st, data=mydata)
print(Ja)

library(numDeriv)
Jn <- jacobian(trf, st, data=mydata)
print(Jn)
print(max(abs(Jn-Ja)))
ssf <- function(par, data){
   rr <- trf(par, data)
   ss <- crossprod(rr)
}
print(ssf(st, data=mydata))

library(numDeriv)
print(jacobian(trf, st, data=mydata))

## ----gnjn, eval=FALSE----------------------------------------------------
#  gnjn <- function(start, resfn, jacfn = NULL, trace = FALSE,
#  		data=NULL, control=list(), ...){
#  # simplified Gauss Newton
#     offset = 1e6 # for no change in parms
#     stepred <- 0.5 # start with this as per nls()
#     par <- start
#     cat("starting parameters:")
#     print(par)
#     res <- resfn(par, data, ...)
#     ssbest <- as.numeric(crossprod(res))
#     cat("initial ss=",ssbest,"\n")
#     par0 <- par
#     kres <- 1
#     kjac <- 0
#     keepon <- TRUE
#     while (keepon) {
#        cat("kjac=",kjac,"  kres=",kres,"  SSbest now ", ssbest,"\n")
#        print(par)
#        JJ <- jacfn(par, data, ...)
#        kjac <- kjac + 1
#        QJ <- qr(JJ)
#        delta <- qr.coef(QJ, -res)
#        ss <- ssbest + offset*offset # force evaluation
#        step <- 1.0
#        if (as.numeric(max(par0+delta)+offset) != as.numeric(max(par0+offset)) ) {
#           while (ss > ssbest) {
#             par <- par0+delta * step
#             res <- resfn(par, data, ...)
#             ss <- as.numeric(crossprod(res))
#             kres <- kres + 1
#  ##           cat("step =", step,"  ss=",ss,"\n")
#  ##           tmp <- readline("continue")
#             if (ss > ssbest) {
#                step <- step * stepred
#             } else {
#                par0 <- par
#                ssbest <- ss
#             }
#           } # end inner loop
#           if (kjac >= 4)  {
#              keepon = FALSE
#              cat("artificial stop at kjac=4 -- we only want to check output")
#           }
#        } else { keepon <- FALSE # done }
#     } # end main iteration
#  } # seems to need this
#  
#  } # end gnjne
#  
#  fitgnjn0 <- gnjn(st, trf, trj, data=mydata)
#  ## Another way
#  #- set lamda = 0 in nlxb, fix laminc, lamdec
#  library(nlsr)
#  nlx00 <- try(nlxb(y0 ~ aa * exp(-bb*tt) + cc, start=st, data=mydata, trace=TRUE,
#                       control=list(lamda=0, laminc=0, lamdec=0, watch=TRUE)))
#  nlx00
#  

## ----gnjn2, eval=FALSE---------------------------------------------------
#  gnjn2 <- function(start, resfn, jacfn = NULL, trace = FALSE,
#  		data=NULL, control=list(), ...){
#  # simplified Gauss Newton
#     offset = 1e6 # for no change in parms
#     stepred <- 0.5 # start with this as per nls()
#     par <- start
#     cat("starting parameters:")
#     print(par)
#     res <- resfn(par, data, ...)
#     ssbest <- as.numeric(crossprod(res))
#     cat("initial ss=",ssbest,"\n")
#     kres <- 1
#     kjac <- 0
#     par0 <- par
#     keepon <- TRUE
#     while (keepon) {
#        cat("kres=",kres,"  kjac=",kjac,"   SSbest now ", ssbest,"\n")
#        print(par)
#        JJ <- jacfn(par, data, ...)
#        kjac <- kjac + 1
#        JTJ <- crossprod (JJ)
#        JTr <- crossprod (JJ, res)
#        delta <- - as.vector(solve(JTJ, JTr))
#        ss <- ssbest + offset*offset # force evaluation
#        step <- 1.0
#        if (as.numeric(max(par0+delta)+offset) != as.numeric(max(par0+offset)) ) {
#           while (ss > ssbest) {
#             par <- par0+delta * step
#             res <- resfn(par, data, ...)
#             ss <- as.numeric(crossprod(res))
#             kres <- kres + 1
#  ##           cat("step =", step,"  ss=",ss,"  best is",ssbest,"\n")
#  ##           tmp <- readline("continue")
#             if (ss > ssbest) {
#                step <- step * stepred
#             } else {
#                par0 <- par
#                ssbest <- ss
#             }
#           } # end inner loop
#           if (kjac >= 4)  {
#              keepon = FALSE
#              cat("artificial stop at kjac=4 -- we only want to check output")
#           }
#        } else { keepon <- FALSE # done }
#     } # end main iteration
#  } # seems to need this
#  } # end gnjn2
#  
#  fitgnjn20 <- gnjn2(st, trf, trj, data=mydata)
#  

## ----scaling-------------------------------------------------------------
rm(list=ls())
require(nlsr)
# want to have data AND extra parameters (NOT to be estimated)
traceval  <-  TRUE  # traceval set TRUE to debug or give full history
# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing
# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.
start1  <-  c(b1=1, b2=1, b3=1)
startf1  <-  c(b1=1, b2=1, b3=.1)
eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))
cat("LOCAL DATA IN DATA FRAMES\n")
weeddata1  <-  data.frame(y=ydat, tt=tdat)
cat("weeddata contains the original data\n")
ms <- 2 # define the external parameter here
cat("wdata scales y by ms =",ms,"\n")
wdata <- data.frame(y=ydat/ms, tt=tdat)
wdata
cat("estimate the UNSCALED model with SCALED data\n")
anlxbs  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=wdata))
print(anlxbs)
escal <-  y ~ ms*b1/(1+b2*exp(-b3*tt))
cat("estimate the SCALED model with scaling provided in the call (ms=0.5)\n")
anlxbh  <-  try(nlxb(escal, start=start1, trace=traceval, data=weeddata1, ms=0.5))
print(anlxbh)
cat("\n scaling is now using the globally defined value of ms=",ms,"\n")
anlxb1a  <-  try(nlxb(escal, start=start1, trace=traceval, data=weeddata1))
print(anlxb1a)
ms <- 1
cat("\n scaling is now using the globally re-defined value of ms=",ms,"\n")
anlxb1b  <-  try(nlxb(escal, start=start1, trace=traceval, data=weeddata1))
print(anlxb1b)

## ----useex1--------------------------------------------------------------
require(nlsr)
traceval <- FALSE
# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing

# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.
start1  <-  c(b1=1, b2=1, b3=1)

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("LOCAL DATA IN DATA FRAMES\n")
weeddata1  <-  data.frame(y=ydat, tt=tdat)
weeddata2  <-  data.frame(y=1.5*ydat, tt=tdat)

anlxb1  <-  try(nlxb(eunsc, start=start1, trace=TRUE, data=weeddata1,
                     control=list(watch=FALSE)))
print(anlxb1)

anlsb1 <-  try(nls(eunsc, start=start1, trace=TRUE, data=weeddata1))
print(anlsb1)

## ----usex2---------------------------------------------------------------
startf1  <-  c(b1=1, b2=1, b3=.1)
anlsf1 <-  try(nls(eunsc, start=startf1, trace=TRUE, data=weeddata1))
print(anlsf1)

library(nlsr)
anlxf1  <-  try(nlxb(eunsc, start=startf1, trace=TRUE, data=weeddata1,
                     control=list(watch=FALSE)))
print(anlxf1)

# anlxb2  <-  try(nlxb(eunsc, start=start1, trace=FALSE, data=weeddata2))
# print(anlxb2)

## ----usex3---------------------------------------------------------------
cf1 <- coef(anlxf1)
print(cf1)
jf1 <- anlxf1$jacobian
svals <- svd(jf1)$d
print(svals)

## ----usex4---------------------------------------------------------------
require(nlsr)
traceval <- FALSE
# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat  <-  seq_along(ydat) # for testing

# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.
start1  <-  c(b1=1, b2=1, b3=1)

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("LOCAL DATA IN DATA FRAMES\n")
weeddata1  <-  data.frame(y=ydat, tt=tdat)

## ----usex5---------------------------------------------------------------
weedrj <- model2rjfun(modelformula=eunsc, pvec=start1, data=weeddata1)



weedrj
rjfundoc(weedrj) # Note how useful this is to report status


## ----mod2rjopt-----------------------------------------------------------
y <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558,
50.156, 62.948, 75.995, 91.972)
tt <- seq_along(y) # for testing
mydata <- data.frame(y = y, tt = tt)
f <- y ~ 100*b1/(1 + 10*b2 * exp(-0.1 * b3 * tt))
p <- c(b1 = 1, b2 = 1, b3 = 1)
rjfn <- model2rjfun(f, p, data = mydata)
rjfn(p)

myfn <- function(p, resfn=rjfn){
  val <- resss(p, resfn)
}

p <- c(b1 = 2, b2=2, b3=1)

a1 <- optim(p, myfn, control=list(trace=0))
a1

## ----embedfn-------------------------------------------------------------
a2 <- optim(p, function(p,resfn=rjfn){resss(p,resfn)}, control=list(trace=0))
a2

## ----weibull-------------------------------------------------------------
require(nlsr)

y=c(5,11,21,31,46,75,98,122,145,165,195,224,245,293,321,330,350,420) # data set

Nweibull2 <- function(x,prm){
  la <- prm[1]
  al <- prm[2]
  be<- prm[3]
  val2 <- la*be*(x/al)^(be-1)* exp( (x/al)^be+la*al*(1-exp((x/al)^be) ) )
  val2
}
LL2J <- function(par,y) {
R = Nweibull2(y,par)
-sum(log(R))
}

## ----weibull2------------------------------------------------------------
# Put in the main expression for the Nweibull pdf.
## we generate the three gradient components
g1n <- nlsDeriv(~ la*be*(x/al)^(be-1)* exp( (x/al)^be+la*al*(1-exp((x/al)^be) ) ), "la")
g1n
g2n <- nlsDeriv(~ la*be*(x/al)^(be-1)* exp( (x/al)^be+la*al*(1-exp((x/al)^be) ) ), "al")
g2n
g3n <- nlsDeriv(~ la*be*(x/al)^(be-1)* exp( (x/al)^be+la*al*(1-exp((x/al)^be) ) ), "be")
g3n

## ----nwei2g--------------------------------------------------------------
Nwei2g <- function(x, prm){
  la <- prm[1]
  al <- prm[2]
  be<- prm[3]
g1v <- la * be * (x/al)^(be - 1) * (exp((x/al)^be + la * al * (1 - exp((x/al)^be))) * 
    (al * (1 - exp((x/al)^be)))) + be * (x/al)^(be - 1) * exp((x/al)^be + 
    la * al * (1 - exp((x/al)^be)))

g2v <- la * be * (x/al)^(be - 1) * (exp((x/al)^be + la * al * (1 - exp((x/al)^be))) * 
    (be * (x/al)^(be - 1) * -(x/al^2) + (la * al * -(exp((x/al)^be) * 
        (be * (x/al)^(be - 1) * -(x/al^2))) + la * (1 - exp((x/al)^be))))) + 
    la * be * ((be - 1) * (x/al)^(be - 1 - 1) * -(x/al^2)) * 
        exp((x/al)^be + la * al * (1 - exp((x/al)^be)))

g3v <- la * be * (x/al)^(be - 1) * (exp((x/al)^be + la * al * (1 - exp((x/al)^be))) * 
    ((x/al)^be * log(x/al) + la * al * -(exp((x/al)^be) * ((x/al)^be * 
        log(x/al))))) + (la * be * ((x/al)^(be - 1) * log(x/al)) + 
    la * (x/al)^(be - 1)) * exp((x/al)^be + la * al * (1 - exp((x/al)^be)))
gg <- matrix(data=c(g1v, g2v, g3v), ncol=3)
}

## ----checkgrad-----------------------------------------------------------
start1 <- c(lambda=.01,alpha=340,beta=.8)
start2 <- c(lambda=.01,alpha=340,beta=.7)

require(numDeriv)
ganwei <- Nwei2g(y, prm=start1)

require(numDeriv)
Nw <- function(x, y) {
   Nweibull2(y, x)
} # to allow grad() to work

gnnwei <- matrix(NA, nrow=length(y), ncol=3)
for (i in 1:length(y)){
   gnrow <- grad(Nw, x=start1, y=y[i])
   gnnwei[i,] <- gnrow
}
gnnwei
ganwei
cat("max(abs(gnnwei - ganwei))= ",   max(abs(gnnwei - ganwei)),"\n")

## ----LL2J----------------------------------------------------------------
## and now we can build the gradient of LL2J
LL2Jg <- function(prm, y) {
    R = Nweibull2(y,prm)
    gNN <- Nwei2g(y, prm)
#    print(str(gNN)
    gL <- - as.vector( t(1/R) %*% gNN) 
}
# test
gaLL2J <- LL2Jg(start1, y)
gaLL2J
gnLL2J <- grad(LL2J, start1, y=y)
gnLL2J
cat("max(abs(gaLL2J-gnLL2J))= ", max(abs(gaLL2J-gnLL2J)), "\n" )

## ----appx1, cache=FALSE, echo=FALSE--------------------------------------
library(knitr)
# read chunk (does not run code)
# read_chunk('/home/john/rsvnall/optimizer/pkg/nlsr/inst/dev-files/nlsdata.R')
read_chunk(system.file('dev-files/nlsdata.R', package = 'nlsr'))
# We use this approach to avoid having differences between file here and in inst/extdata/

## ----nlsdata-------------------------------------------------------------
## @knitr nlsdata.R
# try different ways of supplying data to R nls stuff
ydata <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 38.558,
50.156, 62.948, 75.995, 91.972)
ttdata <- seq_along(ydata) # for testing

mydata <- data.frame(y = ydata, tt = ttdata)

hobsc <- y ~ 100*b1/(1 + 10*b2 * exp(-0.1 * b3 * tt))

ste <- c(b1 = 2, b2 = 5, b3 = 3)

# let's try finding the variables

findmainenv <- function(formula, prm) {
   vn <- all.vars(formula)
   pnames <- names(prm)
   ppos <- match(pnames, vn)
   datvar <- vn[-ppos]
   cat("Data variables:")
   print(datvar)
   cat("Are the variables present in the current working environment?\n")
   for (i in seq_along(datvar)){
       cat(datvar[[i]]," : present=",exists(datvar[[i]]),"\n")
   }
}


findmainenv(hobsc, ste)
y <- ydata
tt <- ttdata
findmainenv(hobsc, ste)
rm(y)
rm(tt)

# ===============================


# let's try finding the variables in dotargs

finddotargs <- function(formula, prm, ...) {
   dots <- list(...)
   cat("dots:")
   print(dots)
   cat("names in dots:")
   dtn <- names(dots)
   print(dtn)
   vn <- all.vars(formula)
   pnames <- names(prm)
   
   ppos <- match(pnames, vn)
   datvar <- vn[-ppos]
   cat("Data variables:")
   print(datvar)
   cat("Are the variables present in the dot args?\n")
   for (i in seq_along(datvar)){
       dname <- datvar[[i]]
       cat(dname," : present=",(dname %in% dtn),"\n")
   }
}

finddotargs(hobsc, ste, y=ydata, tt=ttdata)
# ===============================

y <- ydata
tt <- ttdata
tryq <- try(nlsquiet <- nls(formula=hobsc, start=ste))
if (class(tryq) != "try-error") {print(nlsquiet)} else {cat("try-error\n")}
#- OK
rm(y)
rm(tt)


tdots<-try(nlsdots <- nls(formula=hobsc, start=ste, y=ydata, tt=ttdata))
if ( class(tdots) != "try-error") {print(nlsdots)} else {cat("try-error\n")}
#- Fails
tframe <- try(nlsframe <- nls(formula=hobsc, start=ste, data=mydata))
if (class(tframe) != "try-error") {print(nlsframe)} else {cat("try-error\n")}
#- OK

library(nlsr)
y <- ydata
tt <- ttdata
tquiet <- try(nlsrquiet <- nlxb(formula=hobsc, start=ste))
if ( class(tquiet) != "try-error") {print(nlsrquiet)}
#- OK
rm(y)
rm(tt)
test <- try(nlsrdots <- nlxb(formula=hobsc, start=ste, y=ydata, tt=ttdata))
  if (class(test) != "try-error") { print(nlsrdots) } else {cat("Try error\n") }
#- Note -- does NOT work -- do we need to specify the present env. in nlfb for y, tt??
test2 <- try(nlsframe <- nls(formula=hobsc, start=ste, data=mydata))
if (class(test) != "try-error") {print(nlsframe) } else {cat("Try error\n") }
#- OK


library(minpack.lm)
y <- ydata
tt <- ttdata
nlsLMquiet <- nlsLM(formula=hobsc, start=ste)
print(nlsLMquiet)
#- OK
rm(y)
rm(tt)
## Dotargs
tdots <- try(nlsLMdots <- nlsLM(formula=hobsc, start=ste, y=ydata, tt=ttdata))
if (class(tdots) != "try-error") { print(nlsLMdots) } else {cat("try-error\n") }
#-  Note -- does NOT work
## dataframe
tframe <- try(nlsLMframe <- nlsLM(formula=hobsc, start=ste, data=mydata) )
if (class(tdots) != "try-error") {print(nlsLMframe)} else {cat("try-error\n") }
#- does not work

## detach("package:nlsr", unload=TRUE)
## Uses nlmrt here for comparison
## library(nlmrt)
## txq <- try( nlxbquiet <- nlxb(formula=hobsc, start=ste))
## if (class(txq) != "try-error") {print(nlxbquiet)} else { cat("try-error\n")}
#- Note -- does NOT work
## txdots <- try( nlxbdots <- nlxb(formula=hobsc, start=ste, y=y, tt=tt) )
## if (class(txdots) != "try-error") {print(nlxbdots)} else {cat("try-error\n")}
#- Note -- does NOT work
## dataframe
## nlxbframe <- nlxb(formula=hobsc, start=ste, data=mydata)
## print(nlxbframe)
#- OK

