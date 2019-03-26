## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
deltabetaincomp <- function(a,b,d)
  -d^a*(1-d)^b/a/beta(a,b)
deltatheo <- function(a,b,d)
  pbeta(d,a+1,b)-pbeta(d,a,b)
c(deltabetaincomp(pi, 1/pi, 4/5), deltatheo(pi, 1/pi, 4/5))

## ---- message=FALSE------------------------------------------------------
library(mbbefd)
theo <- function(a,b,d) 
  d*(1 - pbeta(d,a,b))*{a+b}/{a}+pbeta(d,a,b)-{d^a*(1-d)^b}/{a*beta(a,b)}
  
theo2 <- function(a,b,d)
  pbeta(d,a+1,b) + d*(1-pbeta(d,a,b))*(a+b)/a
emp <- function(n, a, b, d)
{
  x <- rbeta(n, a, b)
  mean(pmin(x,d))/mean(x)
}
c(theo(3,2,1/pi), theo2(3,2,1/pi), emp(1e6, 3,2,1/pi), ecbeta(1/pi, 3, 2))

