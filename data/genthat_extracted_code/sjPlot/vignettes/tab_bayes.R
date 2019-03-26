params <-
list(EVAL = TRUE)

## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, 
  comment = "#>", 
  message = FALSE,
  eval = if (isTRUE(exists("params"))) params$EVAL else FALSE
)

## ---- results='hide', message=FALSE, warning=FALSE-----------------------
# load required packages
library(sjPlot)
library(sjmisc)
library(brms)

# load sample datasets
data("efc")
efc <- to_factor(efc, e42dep, c172code, c161sex, e15relat)
zinb <- read.csv("http://stats.idre.ucla.edu/stat/data/fish.csv")

# fit two sample models
m1 <- brm(
  bf(count ~ child + camper + (1 | persons), 
     zi ~ child + camper),
  data = zinb,
  family = zero_inflated_poisson(),
  cores = 4,
  iter = 1000
)

f1 <- bf(neg_c_7 ~ e42dep + c12hour + c172code + (1 |ID| e15relat))
f2 <- bf(c12hour ~ c172code + (1 |ID| e15relat))
m2 <- brm(
  f1 + f2 + set_rescor(FALSE), 
  data = efc, 
  cores = 4,
  iter = 1000
)

## ------------------------------------------------------------------------
tab_model(m1)

## ------------------------------------------------------------------------
tab_model(m2)

## ------------------------------------------------------------------------
tab_model(m2, show.hdi50 = FALSE)

## ------------------------------------------------------------------------
tab_model(m1, m2, show.hdi50 = F)

