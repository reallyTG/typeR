## ------------------------------------------------------------------------
outcomes <- '2NN 3NN 4TT'

## ------------------------------------------------------------------------
skeleton <- c(0.05, 0.15, 0.25, 0.4, 0.6)
target <- 0.25

## ---- message=FALSE, warning=FALSE---------------------------------------
library(trialr)

## ---- results = "hide", warning=FALSE, message=FALSE---------------------
mod <- stan_crm(outcomes, skeleton = skeleton, target = target, 
                beta_sd = sqrt(1.34), seed = 123)
mod

## ---- warning=FALSE, message=FALSE---------------------------------------
library(tidyr)
library(dplyr)

prob_tox_samp <- as.data.frame(mod, 'prob_tox')
prob_tox_samp_tall <- prob_tox_samp %>%
  gather(Label, ProbTox) %>%
  mutate(
    DoseLevel = rep(1:ncol(prob_tox_samp), each = nrow(prob_tox_samp)),
    Draw = rep(1:nrow(prob_tox_samp), times = ncol(prob_tox_samp))
  )

## ------------------------------------------------------------------------
prob_tox_samp_tall %>% head(10)

## ---- fig.width=7, fig.height=7------------------------------------------
library(ggplot2)

(p1 <- ggplot(prob_tox_samp_tall, aes(x = DoseLevel, y = ProbTox, group = DoseLevel)) +
  geom_boxplot() + ylim(0, 1) + labs(title = 'boxplot of Pr(DLT) under CRM'))

## ---- fig.width=7, fig.height=7------------------------------------------
(p2 <- ggplot(prob_tox_samp_tall, aes(x = DoseLevel, y = ProbTox, group = DoseLevel)) +
    geom_violin(fill = 'orange') + ylim(0, 1) + labs(title = 'violin plot of Pr(DLT) under CRM'))

## ---- fig.width=7, fig.height=7------------------------------------------
library(ggridges)
ggplot(prob_tox_samp_tall %>% mutate(DoseLevel = factor(DoseLevel)),
       aes(x = ProbTox, y = DoseLevel, fill = DoseLevel)) +
  geom_density_ridges() + theme(legend.position = 'none') +
  labs(title = 'joyplot of Pr(DLT) under CRM')

## ---- fig.width=7, fig.height=7, message=FALSE, warning=FALSE------------
library(magrittr)

apply(prob_tox_samp, 1, function(x) which.min(abs(x - target))) %>% 
  data.frame(Dose = .) %>% 
  ggplot() + stat_count(aes(x = Dose, y = ..prop.., group = 1)) +
  labs(title = 'Posterior probability that each dose is the MTD',
       y = 'Prob(MTD)')

## ---- fig.width=7, fig.height=7------------------------------------------
colMeans(prob_tox_samp > target) %>% 
  data.frame(ProbToxic = ., DoseLevel = 1:length(skeleton)) %>%
  ggplot(aes(x = DoseLevel, y = ProbToxic)) + geom_col() + 
  labs(title = 'Posterior probability that each dose is too toxic',
       y = 'Prob(Tox > target)')

