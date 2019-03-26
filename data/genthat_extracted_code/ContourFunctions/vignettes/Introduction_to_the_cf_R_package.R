## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=6)

## ----cf_grid-------------------------------------------------------------
library(ContourFunctions)
a <- b <- seq(-4*pi, 4*pi, len = 27)
r <- sqrt(outer(a^2, b^2, "+"))
cf_grid(a, b, cos(r^2)*exp(-r/(2*pi)))

## ----cf_grid bar---------------------------------------------------------

cf_grid(a, b, cos(r^2)*exp(-r/(2*pi)), bar=TRUE)

## ------------------------------------------------------------------------
f1 <- function(r) cos(r[1]^2 + r[2]^2)*exp(-sqrt(r[1]^2 + r[2]^2)/(2*pi))
cf_func(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi))

## ------------------------------------------------------------------------
cf_func(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi), n=27)

## ----cf_data-------------------------------------------------------------
set.seed(0)
x <- runif(20)
y <- runif(20)
z <- exp(-(x-.5)^2-5*(y-.5)^2)# + rnorm(20,0,.05)
# cf_data(x,y,z)
cf_data(x,y,z, bar=T)

## ------------------------------------------------------------------------
cf_func(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi))
points(c(0,0), pch=19)

## ------------------------------------------------------------------------
cf_func(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi), pts=c(0,0))

## ------------------------------------------------------------------------
cf_func(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi),
        afterplotfunc=function() {
          points(5, 5, pch=19)
          text(-5,5,"Text here")
          legend('bottomright', legend=c(1,2,3), fill=c(1,2,3))
          abline(a=0, b=1, col=2)
          }
        )

## ----cf for func---------------------------------------------------------
cf(f1, xlim = c(-4*pi, 4*pi), ylim = c(-4*pi, 4*pi))

## ----cf for data---------------------------------------------------------
cf(x,y,z, bar=T)

