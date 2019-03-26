## ---- echo = FALSE, message = FALSE--------------------------------------
library(edfun)
library(knitr)
knitr::opts_chunk$set(
   # cache = TRUE,
   dpi = 60,
  comment = "#>",
  tidy = FALSE)

# http://stackoverflow.com/questions/24091735/why-pandoc-does-not-retrieve-the-image-file
# < ! -- rmarkdown v1 -->


## ---- eval = FALSE-------------------------------------------------------
#  # install.packages('edfun') # not on CRAN yet

## ---- eval = FALSE-------------------------------------------------------
#  # You'll need devtools
#  if (!require(devtools)) install.packages("devtools");
#  
#  devtools::install_github('talgalili/edfun')

## ------------------------------------------------------------------------
library("edfun")

## ------------------------------------------------------------------------
library(edfun)

## ------------------------------------------------------------------------

set.seed(123)
x <- rnorm(1000)
x_dist <- edfun(x)

f <- x_dist$dfun
curve(f, -2,2)

f <- x_dist$pfun
curve(f, -2,2)

f <- x_dist$qfun
curve(f, 0,1)

new_x <- x_dist$rfun(1000)
hist(new_x)

## ------------------------------------------------------------------------

x <- seq(-4,4, length.out = 1e3)
x_dist <- edfun(x, dfun = dnorm)

f <- x_dist$dfun
curve(f, -2,2)

f <- x_dist$pfun
curve(f, -2,2)

f <- x_dist$qfun
curve(f, 0,1)

new_x <- x_dist$rfun(1000)
hist(new_x)

## ------------------------------------------------------------------------

set.seed(123)
x <- rnorm(1000)
x_dist <- edfun(x, dfun = NULL)

x_dist$dfun

# but this still works just fine:
f <- x_dist$pfun
curve(f, -2,2)
f <- x_dist$qfun
curve(f, 0,1)


## ------------------------------------------------------------------------

x <- seq(-4,4, length.out = 1e3)
x_dist_no_support <- edfun(x, dfun = dnorm)
x_dist_known_support <- edfun(x, dfun = dnorm, support = c(-Inf, Inf))

x_dist_no_support$qfun(0)
x_dist_known_support$qfun(0)


## ---- eval = FALSE-------------------------------------------------------
#   set.seed(2016-08-18)
#    x_simu <- rnorm(1e5)
#    x_funs_simu <- edfun(x_simu, support = c(-Inf, Inf))
#  
#  
#    x <- seq(-4,4, length.out = 1e5)
#    x_funs <- edfun(x, dfun = dnorm, support = c(-Inf, Inf))
#    x_funs$qfun(0) # -Inf
#  
#    # precision - qfun
#    q_to_test <- seq(0.001,.999, length.out = 100)
#    edfun_out <- x_funs$qfun(q_to_test) # -4
#    edfun_simu_out <- x_funs_simu$qfun(q_to_test) # -4
#    real_out <- qnorm(q_to_test)
#  
#    mean(abs(edfun_out-real_out))
#    mean(abs(edfun_simu_out-real_out)) # quite terrible compared to when knowing dfun
#  
#    library(microbenchmark)
#    microbenchmark(dfun_known = x_funs$qfun(q_to_test),
#                   dfun_NOT_known = x_funs_simu$qfun(q_to_test))
#    # same time for the q function!
#  
#  
#    # precision - pfun
#    q_to_test <- seq(-3,3, length.out = 100)
#    edfun_out <- x_funs$pfun(q_to_test) # -4
#    edfun_simu_out <- x_funs_simu$pfun(q_to_test) # -4
#    real_out <- pnorm(q_to_test)
#  
#    mean(abs(edfun_out-real_out))
#    mean(abs(edfun_simu_out-real_out)) # quite terrible compared to when knowing dfun
#  
#    library(microbenchmark)
#    microbenchmark(dfun_known = x_funs$pfun(q_to_test),
#                   dfun_NOT_known = x_funs_simu$pfun(q_to_test))
#    # same time for the p function!
#  
#  
#    # timing for the rfun
#    library(microbenchmark)
#    microbenchmark(dfun_known = x_funs$rfun(100),
#                   dfun_NOT_known = x_funs_simu$rfun(100))
#    # this rfun is slower...

## ------------------------------------------------------------------------
library(edfun)

## ------------------------------------------------------------------------

# credit: library(smoothmest)
ddoublex <- function (x, mu = 0, lambda = 1) {
  exp(-abs(x - mu)/lambda)/(2 * lambda)  
}

curve(ddoublex, -4,4) # the peak in 0 should go to Inf, but it doesn't because of the limits of `curve`

x <- seq(-4,4, length.out = 1e3)
x_dist <- edfun(x, dfun = ddoublex)

f <- x_dist$dfun
curve(f, -4,4)

f <- x_dist$pfun
curve(f, -4,4)

f <- x_dist$qfun
curve(f, 0,1)

new_x <- x_dist$rfun(1000)
hist(new_x)

## ------------------------------------------------------------------------
library(edfun)

## ------------------------------------------------------------------------

# http://stackoverflow.com/questions/20452650/writing-a-bimodal-normal-distribution-function-in-r?rq=1
# random sample:
# mixtools::rnormmix # random sample of a mixture of distributions
# http://stats.stackexchange.com/questions/70855/generating-random-variables-from-a-mixture-of-normal-distributions
# nor1mix::rnorMix
# https://en.wikipedia.org/wiki/Mixture_distribution
# density:
dmixnorm <- function(x, p1 = 0.5, m1=0, m2=0, s1=1, s2=1) {
  p1 * dnorm(x, m1, s1) + (1-p1) * dnorm(x, m2, s2)
}
# a convex mixture of densities is a density:
#  https://en.wikipedia.org/wiki/Mixture_distribution#Properties

# yay - it works.
dmixnorm_1 <- function(x) dmixnorm(x, .75, 0,5,  1,1)
curve(dmixnorm_1, -4,9)


x <- seq(-4,9, length.out = 1e3)
x_dist <- edfun(x, dfun = dmixnorm_1)

f <- x_dist$dfun
curve(f, -4,9)

f <- x_dist$pfun
curve(f, -4,9)

f <- x_dist$qfun
curve(f, 0,1)

new_x <- x_dist$rfun(1000)
hist(new_x)

## ---- cache=FALSE--------------------------------------------------------
sessionInfo()

