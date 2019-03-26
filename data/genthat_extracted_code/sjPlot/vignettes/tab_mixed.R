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
library(lme4)
library(nlme)
data("sleepstudy")
data("Orthodont")

## ------------------------------------------------------------------------
m1 <- lmer(distance ~ age + Sex + (1 | Subject), data = Orthodont)
m2 <- lmer(Reaction ~ Days + (1 + Days | Subject), data = sleepstudy)

tab_model(m1, m2)

## ------------------------------------------------------------------------
tab_model(m1, p.val = "kr", show.df = TRUE)

## ------------------------------------------------------------------------
data("efc")
efc$neg_c_7d <- ifelse(efc$neg_c_7 < median(efc$neg_c_7, na.rm = TRUE), 0, 1)
efc$cluster <- as.factor(efc$e15relat)
m3 <- glmer(
  neg_c_7d ~ c160age + c161sex + e42dep + (1 | cluster),
  data = efc, 
  family = binomial(link = "logit")
)

tab_model(m1, m3)

## ------------------------------------------------------------------------
library(glmmTMB)
data("Salamanders")
m4 <- glmmTMB(
  count ~ spp + mined + (1 | site),
  ziformula = ~ spp + mined, 
  family = truncated_poisson(link = "log"), 
  data = Salamanders
)

tab_model(m1, m3, m4, show.ci = FALSE)

## ------------------------------------------------------------------------
set.seed(2)
sleepstudy$mygrp <- sample(1:30, size = 180, replace = TRUE)
m5 <- lmer(Reaction ~ Days + (1 | mygrp) + (1 | Subject), sleepstudy)

tab_model(m1, m5, show.ci = FALSE, show.adj.icc = TRUE)

