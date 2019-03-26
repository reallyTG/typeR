## ----setup, echo=FALSE, results='hide', warning=FALSE, error=FALSE, message=FALSE, cache=FALSE----
library(knitr)
opts_chunk$set(
  cache = FALSE,
  echo = TRUE,
  warning = FALSE,
  error = FALSE,
  message = FALSE,
  out.width = 700,
  fig.width = 12,
  fig.height = 8,
  dpi = 84,
  concordance = TRUE
)

library(narray)

## ----namespace, eval=FALSE-----------------------------------------------
#  # example referencing the package namespace
#  # do not load the package with 'library(...)' here
#  narray::stack(...)

## ----stack---------------------------------------------------------------
A = matrix(1:4, nrow=2, ncol=2, dimnames=list(c('a','b'),c('x','y')))
B = matrix(5:6, nrow=2, ncol=1, dimnames=list(c('b','a'),'z'))

C = stack(A, B, along=2)
C

D = stack(m=A, n=C, along=3) # we can also introduce new dimensions
D

## ----split---------------------------------------------------------------
split(C, along=2, subsets=c('s1','s1','s2'))

## ----map-----------------------------------------------------------------
map(C, along=2, function(x) x*2) # return same length vector
map(C, along=2, mean, subsets=c('s1', 's1', 's2')) # summarize each subset to scalar

## ----lambda--------------------------------------------------------------
dot = function(x, y) sum(x * y)
lambda(~ dot(A, B), along=c(A=1, B=2))
lambda(~ dot(A, B), along=c(A=1, B=2), simplify=FALSE)

## ----intersect-----------------------------------------------------------
E = matrix(1:6, nrow=3, dimnames=list(c('a','b','d'), c('x','y')))
F = matrix(7:9, nrow=3, dimnames=list(c('b','a','c'), 'z'))

intersect(E, F, along=1)
E
F

## ----construct-----------------------------------------------------------
DF = data.frame(k1=base::rep(letters[1:3],2),
                k2=base::rep(letters[24:25],3), v=1:6)[-6,]
construct(v ~ k1 + k2, data=DF)

## ----mask----------------------------------------------------------------
G = list(a='e1', b=c('e1','e2'), c='e2')
mask(G)

