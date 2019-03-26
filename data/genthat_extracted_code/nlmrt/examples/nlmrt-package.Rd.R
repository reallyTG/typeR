library(nlmrt)


### Name: nlmrt-package
### Title: Tools for solving nonlinear least squares problems. UNDER
###   DEVELOPMENT.
### Aliases: nlmrt-package nlmrt
### Keywords: nls nonlinear least squares

### ** Examples

rm(list=ls())
# library(nlmrt)

# traceval set TRUE to debug or give full history
traceval  <-  FALSE

## Problem in 1 parameter to ensure methods work in trivial case

cat("Problem in 1 parameter to ensure methods work in trivial case\n")
nobs<-8
tt <- seq(1,nobs)
dd <- 1.23*tt + 4*runif(nobs)

df <- data.frame(tt, dd)

a1par<-nlxb(dd ~ a*tt, start=c(a=1), data=df)
a1par


# Data for Hobbs problem
cat("Hobbs weed problem -- unscaled\n")
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
y  <-  ydat  # for testing
tdat  <-  seq_along(ydat) # for testing

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("Hobbs unscaled with data in data frames\n")

weeddata1  <-  data.frame(y=ydat, tt=tdat)
# scale the data 
weeddata2  <-  data.frame(y=1.5*ydat, tt=tdat)
start1  <-  c(b1=1, b2=1, b3=1)
anlxb1  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1))
print(anlxb1)

anlxb2  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata2))
print(anlxb2)

# Problem 2 - Gabor Grothendieck 2016-3-2

cat("Gabor G problem with zero residuals\n")

DF <- data.frame(x = c(5, 4, 3, 2, 1), y = c(1, 2, 3, 4, 5))
library(nlmrt)
nlxb1 <- nlxb(y ~ A * x + B, data = DF, start = c(A = 1, B = 6), trace=TRUE)
print(nlxb1)

# tmp <- readline("continue with start at the minimum -- failed on 2014 version. ")

nlxb0 <- nlxb(y ~ A * x + B, data = DF, start = c(A = -1, B = 6), trace=TRUE)
print(nlxb0) 

## Not run: 
##D # WARNING -- using T can get confusion with TRUE
##D tt  <-  tdat
##D # A simple starting vector -- must have named parameters for nlxb, nls, wrapnls.
##D 
##D cat("GLOBAL DATA\n")
##D 
##D anls1g  <-  try(nls(eunsc, start=start1, trace=traceval))
##D print(anls1g)
##D 
##D cat("GLOBAL DATA AND EXPRESSION -- SHOULD FAIL\n")
##D anlxb1g  <-  try(nlxb(eunsc, start=start1, trace=traceval))
##D print(anlxb1g)
##D 
## End(Not run) # end dontrun

rm(y)
rm(tt)


startf1  <-  c(b1=1, b2=1, b3=.1)


## Not run: 
##D 
##D ## With BOUNDS
##D 
##D anlxb1  <-  try(nlxb(eunsc, start=startf1, lower=c(b1=0, b2=0, b3=0), 
##D       upper=c(b1=500, b2=100, b3=5), trace=traceval, data=weeddata1))
##D print(anlxb1)
##D 
## End(Not run) # end dontrun


# Check nls too
## Not run: 
##D cat("check nls result\n")
##D anlsb1  <-  try(nls(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
##D      upper=c(b1=500, b2=100, b3=5), trace=traceval, data=weeddata1, 
##D              algorithm='port'))
##D print(anlsb1)
##D 
##D # tmp  <-  readline("next")
##D 
## End(Not run) # end dontrun

## Not run: 
##D 
##D anlxb2  <-  try(nlxb(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
##D         upper=c(b1=500, b2=100, b3=.25), trace=traceval, data=weeddata1))
##D print(anlxb2)
##D 
##D 
##D anlsb2  <-  try(nls(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
##D                 upper=c(b1=500, b2=100, b3=.25), trace=traceval, 
##D                 data=weeddata1, algorithm='port'))
##D print(anlsb2)
##D 
##D # tmp  <-  readline("next")
## End(Not run) # end dontrun


## Not run: 
##D cat("UNCONSTRAINED\n")
##D an1q  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1))
##D print(an1q)
##D # tmp  <-  readline("next")
## End(Not run) # end dontrun


## Not run: 
##D cat("TEST MASKS\n")
##D 
##D anlsmnqm  <-  try(nlxb(eunsc, start=start1, lower=c(b1=0, b2=0, b3=0), 
##D    upper=c(b1=500, b2=100, b3=5), masked=c("b2"), trace=traceval, data=weeddata1))
##D print(anlsmnqm)
## End(Not run) # end dontrun


## Not run: 
##D 
##D cat("MASKED\n")
##D 
##D an1qm3  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1, 
##D                 masked=c("b3")))
##D print(an1qm3)
##D # tmp  <-  readline("next")
##D 
##D # Note that the parameters are put in out of order to test code.
##D an1qm123  <-  try(nlxb(eunsc, start=start1, trace=traceval, data=weeddata1, 
##D                   masked=c("b2","b1","b3")))
##D print(an1qm123)
##D # tmp  <-  readline("next")
##D 
## End(Not run) # end dontrun


cat("BOUNDS test problem for Hobbs")
start2  <-  c(b1=100, b2=10, b3=0.1)
an1qb1  <-  try(nlxb(eunsc, start=start2, trace=traceval, data=weeddata1, 
                     lower=c(0,0,0), upper=c(200, 60, .3)))
print(an1qb1)

## tmp  <-  readline("next")


cat("BOUNDS and MASK")

## Not run: 
##D 
##D an1qbm2  <-  try(nlxb(eunsc, start=start2, trace=traceval, data=weeddata1, 
##D                       lower=c(0,0,0), upper=c(200, 60, .3), masked=c("b2")))
##D print(an1qbm2)
##D 
##D # tmp  <-  readline("next")
##D 
## End(Not run) # end dontrun


escal  <-   y ~ 100*b1/(1+10*b2*exp(-0.1*b3*tt))
suneasy  <-  c(b1=200, b2=50, b3=0.3)
ssceasy  <-  c(b1=2, b2=5, b3=3)
st1scal  <-  c(b1=100, b2=10, b3=0.1)


cat("EASY start -- unscaled")
anls01  <-  try(nls(eunsc, start=suneasy, trace=traceval, data=weeddata1))
print(anls01)
anlmrt01  <-  try(nlxb(eunsc, start=ssceasy, trace=traceval, data=weeddata1))
print(anlmrt01)

## Not run: 
##D 
##D cat("All 1s start -- unscaled")
##D anls02  <-  try(nls(eunsc, start=start1, trace=traceval, data=weeddata1))
##D if (class(anls02) == "try-error") {
##D    cat("FAILED:")
##D    print(anls02)
##D } else {
##D    print(anls02)
##D }
##D anlmrt02  <-  nlxb(eunsc, start=start1, trace=traceval, data=weeddata1)
##D print(anlmrt02)
##D 
##D cat("ones start -- scaled")
##D anls03  <-  try(nls(escal, start=start1, trace=traceval, data=weeddata1))
##D print(anls03)
##D anlmrt03  <-  nlxb(escal, start=start1, trace=traceval, data=weeddata1)
##D print(anlmrt03)
##D 
##D cat("HARD start -- scaled")
##D anls04  <-  try(nls(escal, start=st1scal, trace=traceval, data=weeddata1))
##D print(anls04)
##D anlmrt04  <-  nlxb(escal, start=st1scal, trace=traceval, data=weeddata1)
##D print(anlmrt04)
##D 
##D cat("EASY start -- scaled")
##D anls05  <-  try(nls(escal, start=ssceasy, trace=traceval, data=weeddata1))
##D print(anls05)
##D anlmrt05  <-  nlxb(escal, start=ssceasy, trace=traceval, data=weeddata1)
##D print(anlmrt03)
##D 
## End(Not run) # end dontrun


## Not run: 
##D 
##D shobbs.res  <-  function(x){ # scaled Hobbs weeds problem -- residual
##D # This variant uses looping
##D     if(length(x) != 3) stop("hobbs.res -- parameter vector n!=3")
##D     y  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
##D              38.558, 50.156, 62.948, 75.995, 91.972)
##D     tt  <-  1:12
##D     res  <-  100.0*x[1]/(1+x[2]*10.*exp(-0.1*x[3]*tt)) - y
##D }
##D  
##D shobbs.jac  <-  function(x) { # scaled Hobbs weeds problem -- Jacobian
##D     jj  <-  matrix(0.0, 12, 3)
##D     tt  <-  1:12
##D     yy  <-  exp(-0.1*x[3]*tt)
##D     zz  <-  100.0/(1+10.*x[2]*yy)
##D     jj[tt,1]   <-   zz
##D     jj[tt,2]   <-   -0.1*x[1]*zz*zz*yy
##D     jj[tt,3]   <-   0.01*x[1]*zz*zz*yy*x[2]*tt
##D     return(jj)
##D }
##D 
##D cat("try nlfb\n")
##D st  <-  c(b1=1, b2=1, b3=1)
##D low  <-  -Inf
##D up <- Inf
##D 
##D ans1 <- nlfb(st, shobbs.res, shobbs.jac, trace=traceval)
##D ans1
##D cat("No jacobian function -- use internal approximation\n")
##D ans1n <- nlfb(st, shobbs.res, trace=TRUE, control=list(watch=TRUE)) # NO jacfn
##D ans1n
##D 
##D # tmp <- readline("Try with bounds at 2")
##D time2 <- system.time(ans2 <- nlfb(st, shobbs.res, shobbs.jac, upper=c(2,2,2), 
##D                                   trace=traceval))
##D ans2
##D time2
##D 
##D 
## End(Not run) # end dontrun

## Not run: 
##D 
##D cat("BOUNDS")
##D st2s <- c(b1=1, b2=1, b3=1)
##D 
##D an1qb1 <- try(nlxb(escal, start=st2s, trace=traceval, data=weeddata1, 
##D   lower=c(0,0,0), upper=c(2, 6, 3), control=list(watch=FALSE)))
##D print(an1qb1)
##D 
##D # tmp <- readline("next")
##D 
##D ans2 <- nlfb(st2s,shobbs.res, shobbs.jac, lower=c(0,0,0), upper=c(2, 6, 3), 
##D    trace=traceval, control=list(watch=FALSE))
##D print(ans2)
##D 
##D cat("BUT ... nls() seems to do better from the TRACE information\n")
##D anlsb <- nls(escal, start=st2s, trace=traceval, data=weeddata1, lower=c(0,0,0),
##D      upper=c(2,6,3), algorithm='port')
##D cat("However, let us check the answer\n")
##D print(anlsb)
##D cat("BUT...crossprod(resid(anlsb))=",crossprod(resid(anlsb)),"\n")
##D 
## End(Not run) # end dontrun


# tmp <- readline("next")

cat("Try wrapnls\n")
traceval <- FALSE
# Data for Hobbs problem
ydat <- c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
tdat <- seq_along(ydat) # for testing
start1 <- c(b1=1, b2=1, b3=1)
escal <-  y ~ 100*b1/(1+10*b2*exp(-0.1*b3*tt))
up1 <- c(2,6,3)
up2 <- c(1, 5, 9)

weeddata1 <- data.frame(y=ydat, tt=tdat)

an1w <- try(wrapnls(escal, start=start1, trace=traceval, data=weeddata1))
print(an1w)


## Not run: 
##D 
##D cat("BOUNDED wrapnls\n")
##D 
##D an1wb <- try(wrapnls(escal, start=start1, trace=traceval, data=weeddata1, upper=up1))
##D print(an1wb)
##D 
##D 
##D cat("BOUNDED wrapnls\n")
##D 
##D an2wb <- try(wrapnls(escal, start=start1, trace=traceval, data=weeddata1, upper=up2))
##D print(an2wb)
##D 
##D cat("TRY MASKS ONLY\n")
##D 
##D an1xm3 <- try(nlxb(escal, start1, trace=traceval, data=weeddata1, 
##D                    masked=c("b3")))
##D printsum(an1xm3)
##D an1fm3 <- try(nlfb(start1, shobbs.res, shobbs.jac, trace=traceval, 
##D                    data=weeddata1, maskidx=c(3)))
##D printsum(an1fm3)
##D 
##D an1xm1 <- try(nlxb(escal, start1, trace=traceval, data=weeddata1, 
##D                    masked=c("b1")))
##D printsum(an1xm1)
##D an1fm1 <- try(nlfb(start1, shobbs.res, shobbs.jac, trace=traceval, 
##D                    data=weeddata1, maskidx=c(1)))
##D printsum(an1fm1)
##D 
## End(Not run) # end dontrun

# Need to check when all parameters masked.??

## Not run: 
##D 
##D 
##D cat("\n\n Now check conversion of expression to function\n\n")
##D cat("K Vandepoel function\n")
##D 
##D x <- c(1,3,5,7) # data
##D y <- c(37.98,11.68,3.65,3.93)
##D penetrationks28 <- data.frame(x=x,y=y)
##D 
##D cat("Try nls() -- note the try() function!\n")
##D 
##D fit0  <-  try(nls(y ~ (a+b*exp(1)^(-c * x)), data = penetrationks28, 
##D     start = c(a=0,b = 1,c=1), trace = TRUE))
##D print(fit0)
##D 
##D cat("\n\n")
##D 
##D fit1  <-  nlxb(y ~ (a+b*exp(-c*x)), data = penetrationks28, 
##D    start = c(a=0,b=1,c=1), trace = TRUE) 
##D printsum(fit1)
##D 
##D mexprn <- "y ~ (a+b*exp(-c*x))"
##D pvec <- c(a=0,b=1,c=1)
##D bnew <- c(a=10,b=3,c=4)
##D 
##D k.r <- model2resfun(mexprn , pvec)
##D k.j <- model2jacfun(mexprn , pvec)
##D k.f <- model2ssfun(mexprn , pvec)
##D k.g <- model2grfun(mexprn , pvec)
##D 
##D 
##D cat("At pvec:")
##D print(pvec)
##D rp <- k.r(pvec, x=x, y=y)
##D cat(" rp=")
##D print(rp)
##D rf <- k.f(pvec, x=x, y=y)
##D cat(" rf=")
##D print(rf)
##D rj <- k.j(pvec, x=x, y=y)
##D cat(" rj=")
##D print(rj)
##D rg <- k.g(pvec, x=x, y=y)
##D cat(" rg=")
##D print(rg)
##D cat("modss at pvec gives ")
##D print(modss(pvec, k.r, x=x, y=y))
##D cat("modgr at pvec gives ")
##D print(modgr(pvec, k.r, k.j, x=x, y=y))
##D cat("\n\n")
##D 
##D cat("At bnew:")
##D print(bnew)
##D rb <- k.r(bnew, x=x, y=y)
##D cat(" rb=")
##D print(rb)
##D rf <- k.f(bnew, x=x, y=y)
##D cat(" rf=")
##D print(rf)
##D rj <- k.j(bnew, x=x, y=y)
##D cat(" rj=")
##D print(rj)
##D rg <- k.g(bnew, x=x, y=y)
##D cat(" rg=")
##D print(rg)
##D cat("modss at bnew gives ")
##D print(modss(bnew, k.r, x=x, y=y))
##D cat("modgr at bnew gives ")
##D print(modgr(bnew, k.r, k.j, x=x, y=y))
##D cat("\n\n")
##D 
## End(Not run)  ## end of dontrun





