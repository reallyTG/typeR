## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(bpbounds)
library(dplyr)
library(tidyr)

## ------------------------------------------------------------------------
tab1dat <- data.frame(
  z = c(0, 0, 1, 1, 1, 1, 0, 0),
  x = c(0, 0, 0, 0, 1, 1, 1, 1),
  y = c(0, 1, 0, 1, 0, 1, 0, 1),
  freq = c(74, 11514, 34, 2385, 12, 9663, 0, 0)
)

tab1inddat <- uncount(tab1dat, freq)
xt <- xtabs(~ x + y + z, data = tab1inddat)
xt

## ------------------------------------------------------------------------
p <- prop.table(xt, margin = 3)
p

## ------------------------------------------------------------------------
bpres <- bpbounds(p)
sbp = summary(bpres)
print(sbp)

## ------------------------------------------------------------------------
covyz = cov(tab1inddat$y, tab1inddat$z)

covxz = cov(tab1inddat$x, tab1inddat$z)

ace = covyz / covxz
ace

## ------------------------------------------------------------------------
condprob = c(.0064, 0, .9936, 0, .0028, .001, .1972, .799)
tabp = array(condprob,
             dim = c(2, 2, 2),
             dimnames = list(
               x = c(0, 1),
               y = c(0, 1),
               z = c(0, 1)
             )) %>%
  as.table()
bpbounds(tabp)

## ------------------------------------------------------------------------
gtab  = xtabs( ~ y + z, data = tab1inddat)
gp = prop.table(gtab, margin = 2)
gp

ttab  = xtabs( ~ x + z, data = tab1inddat)
tp = prop.table(ttab, margin = 2)
tp

bpres2 = bpbounds(p = gp, t = tp, fmt = "bivariate")
sbp2 = summary(bpres2)
print(sbp2)

## ------------------------------------------------------------------------
mt3 <- c(.83, .05, .11, .01, .88, .06, .05, .01, .72, .05, .20, .03)
p3 = array(mt3,
           dim = c(2, 2, 3),
           dimnames = list(
             x = c(0, 1),
             y = c(0, 1),
             z = c(0, 1, 2)
           ))
p3 = as.table(p3)
bpres3 = bpbounds(p3)
sbp3 = summary(bpres3)
print(sbp3)

## ------------------------------------------------------------------------
set.seed(2232011)
n = 10000
z = rbinom(n, 1, .5)
u = rbinom(n, 1, .5)
px = .05 + .1 * z + .1 * u
x = rbinom(n, 1, px)
p1 = .1 + .2 * z + .05 * x + .1 * u
y1 = rbinom(n, 1, p1)
p2 = .1 + .05 * z + .05 * x + .1 * u
y2 = rbinom(n, 1, p2)

tab1 = xtabs(~ x + y1 + z)
p1 <- prop.table(tab1, margin = 3)

bpres1 = bpbounds(p1)
sbp1 = summary(bpres1)
print(sbp1)

## ------------------------------------------------------------------------
tab2 = xtabs(~ x + y2 + z)
p2 <- prop.table(tab2, margin = 3)

bpres2 = bpbounds(p2)
sbp2 = summary(bpres2)
print(sbp2)

