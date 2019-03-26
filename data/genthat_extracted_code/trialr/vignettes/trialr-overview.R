## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(trialr)

## ------------------------------------------------------------------------
target <- 0.25
skeleton <- c(0.05, 0.15, 0.25, 0.4, 0.6)

## ---- results = "hide", warning=FALSE, message=FALSE---------------------
mod1 <- stan_crm(outcome_str = '2NN 3NN 4TT', skeleton = skeleton, 
                 target = target, model = 'empiric', beta_sd = sqrt(1.34), 
                 seed = 123)

## ------------------------------------------------------------------------
mod1

## ---- fig.width=7, fig.height=7------------------------------------------
library(ggplot2)
plot_df = data.frame(DoseLevel = 1:length(skeleton),
                     ProbTox = mod1$prob_tox)
ggplot(plot_df, aes(x = DoseLevel, y = ProbTox)) +
  geom_point() + geom_line() + ylim(0, 1) + 
  geom_hline(yintercept = target, col = 'orange', linetype = 'dashed') +
  labs(title = 'Posterior dose-toxicity curve under empiric CRM model')

## ---- results = "hide"---------------------------------------------------
outcomes <- '1NNE 2EEB'
mod <- stan_efftox_demo(outcomes, seed = 123)

## ------------------------------------------------------------------------
mod

## ------------------------------------------------------------------------
mod$recommended_dose

## ------------------------------------------------------------------------
mod$utility

## ---- fig.width=7, fig.height=7------------------------------------------
efftox_contour_plot(mod$dat, prob_eff = mod$prob_eff, prob_tox = mod$prob_tox)
title('EffTox utility contours')

## ------------------------------------------------------------------------
dat <- thallhierarchicalbinary_parameters_demo()
dat

## ---- results = "hide"---------------------------------------------------
samp <- rstan::sampling(stanmodels$ThallHierarchicalBinary, data = dat, 
                        seed = 123)

## ---- fig.width=7, fig.height=7, warning=FALSE, message=FALSE------------
library(dplyr)
library(tidyr)
as.data.frame(samp, 'p') %>% 
  gather(Cohort, ProbResponse) %>% 
  ggplot(aes(x = Cohort, y = ProbResponse, group = Cohort)) + 
  geom_boxplot() + geom_hline(yintercept = 0.3, col = 'orange', linetype = 'dashed') +
  labs(title = 'Partially-pooled analysis of response rate in 10 sarcoma subtypes')

