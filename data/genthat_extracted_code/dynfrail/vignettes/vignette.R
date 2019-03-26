## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(message = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("tbalan/dynfrail")

## ---- eval = FALSE-------------------------------------------------------
#  install.packages(c("RcppArmadillo", "tibble", "magrittr", "dplyr", "tidyr"))

## ------------------------------------------------------------------------
library(parfm)
library(dplyr)
data(asthma)

small_asthma <- 
  asthma %>% 
  group_by(Patid) %>% 
  mutate(linenr = 1:n()) %>% 
  filter(linenr <= 3)

## ------------------------------------------------------------------------
head(small_asthma)

## ------------------------------------------------------------------------
library(dynfrail)
m2 <- dynfrail(Surv(Begin, End, Status) ~ Drug + cluster(Patid), data = small_asthma,
         distribution = dynfrail_dist(n_ints = 1))
m2

## ------------------------------------------------------------------------
m3_ig <- dynfrail(Surv(Begin, End, Status) ~ Drug + cluster(Patid), data = small_asthma,
         distribution = dynfrail_dist(dist = "pvf", n_ints = 2))
m3_ig

## ------------------------------------------------------------------------
with(m3_ig, plot(tev, cumsum(hazard), main = "Baseline cumulative hazard", ylab = "H0", xlab = "time"))

## ------------------------------------------------------------------------
m3_ig$frail_id %>% 
  select(id, tstart, tstop, frail) %>% 
  head()

## ------------------------------------------------------------------------
library(ggplot2)
m3_ig$frail_id %>% 
  filter(id == 1) %>% 
  ggplot() + geom_segment(aes(x = tstart, xend = tstop, y = frail, yend = frail)) + 
  ylim(c(0, 3)) + 
  theme_classic()


## ------------------------------------------------------------------------
m3_ig$frail_id %>% 
  filter(id <= 3) %>% 
  mutate(id = as.factor(id)) %>% 
  ggplot() + geom_segment(aes(x = tstart, xend = tstop, y = frail, yend = frail, colour = id)) + 
  ylim(c(0, 3)) + 
  theme_classic()

## ------------------------------------------------------------------------
m5_ig <- dynfrail(Surv(Begin, End, Status) ~ Drug + cluster(Patid), data = small_asthma,
         distribution = dynfrail_dist(dist = "pvf", n_ints = 4))
m5_ig

## ------------------------------------------------------------------------
m5_ig$frail_id %>% 
  filter(id <= 3) %>% 
  mutate(id = as.factor(id)) %>% 
  ggplot() + geom_segment(aes(x = tstart, xend = tstop, y = frail, yend = frail, colour = id)) + 
  ylim(c(0, 3)) + 
  theme_classic()

## ------------------------------------------------------------------------
c(m3_ig$loglik[2], m5_ig$loglik[2])

## ------------------------------------------------------------------------
m5_ig

## ------------------------------------------------------------------------
args_5 <- dynfrail_prep(formula = Surv(Begin, End, Status) ~ Drug + cluster(Patid), 
    data = small_asthma, distribution = dynfrail_dist(dist = "pvf", 
        n_ints = 4))

lik_5 <- do.call(dynfrail_fit, c(logfrailtypar = list(c(log(3), m5_ig$loglambda)), args_5))
lik_5

## ------------------------------------------------------------------------
m1 <- dynfrail(Surv(Begin, End, Status) ~ Drug + cluster(Patid), data = small_asthma,
         distribution = dynfrail_dist(n_ints = 0))
m1

## ------------------------------------------------------------------------
library(frailtyEM)
m1_sf <- emfrail(Surv(Begin, End, Status) ~ Drug + cluster(Patid), data = small_asthma)
summary(m1_sf)

