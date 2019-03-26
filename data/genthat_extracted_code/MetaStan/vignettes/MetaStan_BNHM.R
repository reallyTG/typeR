## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#"
)

## ----install, eval = FALSE-----------------------------------------------
#  devtools:::install_github("gunhanb/MetaStan")

## ----dataset-------------------------------------------------------------
library("MetaStan")
data("dat.Berkey1995", package = "MetaStan")
head(dat.Berkey1995)

## ----forestplot, echo=TRUE, results=TRUE---------------------------------
library(ggplot2)
# Calculating log odds ratios and variances from data
logodds <- function(x) log((x[1] * (x[4] - x[3]))/((x[2] - x[1]) * x[3]))
stdes   <- function(x) sqrt(1/x[1] + 1/(x[2] - x[1]) + 1/x[3] + 1/(x[4] - x[3]))
r_ind   <- apply(cbind(dat.Berkey1995$rt, dat.Berkey1995$nt, 
                 dat.Berkey1995$rc, dat.Berkey1995$nc), 1, logodds)
se_ind  <- apply(cbind(dat.Berkey1995$rt, dat.Berkey1995$nt, 
                 dat.Berkey1995$rc, dat.Berkey1995$nc), 1, stdes)
lower95_ind <- r_ind + qnorm(.025) * se_ind
upper95_ind <- r_ind + qnorm(.975) * se_ind
# Comparison of the results
trials  <- c("1", "2" ,"3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13")
trials <- ordered(trials, levels = trials)

d <- data.frame(x = trials,
                y = r_ind,
                ylo = lower95_ind,
                yhi = upper95_ind)
forest.plot <- ggplot(d, aes(x = x, y = y, ymin = ylo, ymax = yhi)) +
  geom_pointrange() +
  coord_flip() +
  geom_hline(aes(yintercept=0), lty = 2) +
  xlab("Studies") +
  ggtitle("Forest Plot (BCG vaccines)")

plot(forest.plot)

## ----bnhmFit, results="hide"---------------------------------------------
bnhm1.BCG.stan  <- meta_stan(ntrt = dat.Berkey1995$nt, 
                             nctrl = dat.Berkey1995$nc, 
                             rtrt = dat.Berkey1995$rt,
                             rctrl = dat.Berkey1995$rc,
                             tau_prior_dist = "half-normal",
                             tau_prior = 0.5,
                             theta_prior = c(0, 2.82),
                             model = "BNHM1",
                             chains = 4,
                             iter = 2000,
                             warmup = 1000)

## ----shinystan, eval = FALSE---------------------------------------------
#  library("shinystan")
#  ## Firstly convert "stan" object to a "shinystan" object
#  bnhm1.BCG.shinystan = as.shinystan(bnhm1.BCG.stan$fit)
#  launch_shinystan(bnhm1.BCG.shinystan)

## ----print---------------------------------------------------------------
print(bnhm1.BCG.stan)

## ----bnhm2Fit, results="hide"--------------------------------------------
bnhm2.BCG.stan  <- meta_stan(ntrt = dat.Berkey1995$nt, 
                             nctrl = dat.Berkey1995$nc, 
                             rtrt = dat.Berkey1995$rt,
                             rctrl = dat.Berkey1995$rc,
                             theta_prior = c(0, 2.82),
                             tau_prior_dist = "half-normal",
                             tau_prior = 0.5,
                             model = "BNHM2")

## ----print2--------------------------------------------------------------
print(bnhm2.BCG.stan)

