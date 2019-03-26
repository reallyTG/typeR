library(frailtyEM)


### Name: summary.emfrail
### Title: Summary for 'emfrail' objects
### Aliases: summary.emfrail

### ** Examples

data("bladder")
mod_gamma <- emfrail(Surv(start, stop, status) ~ treatment + cluster(id), bladder1)
summary(mod_gamma)
summary(mod_gamma, print_opts = list(frailty_verbose = FALSE))

# plot the Empirical Bayes estimates of the frailty
# easy way:
plot(mod_gamma, type = "hist")

# a fancy graph:
sum_mod <- summary(mod_gamma)
library(dplyr)
library(ggplot2)

# Create a plot just with the points
pl1 <- sum_mod$frail %>%
  arrange(z) %>%
  mutate(x = 1:n()) %>%
  ggplot(aes(x = x, y = z)) +
  geom_point()

# If the quantiles of the posterior distribution are
# known, then error bars can be added:
if(!is.null(sum_mod$frail$lower_q))
  pl1 <- pl1 + geom_errorbar(aes(ymin = lower_q, ymax = upper_q), alpha = 0.5)

pl1

# The plot can be made interactive!
# ggplot2 gives a warning about the "id" aesthetic, just ignore it
pl2 <- sum_mod$frail %>%
  arrange(z) %>%
  mutate(x = 1:n()) %>%
  ggplot(aes(x = x, y = z)) +
  geom_point(aes(id = id))

if(!is.null(sum_mod$z$lower_q))
  pl2 <- pl2 + geom_errorbar(aes(ymin = lower_q, ymax = upper_q, id = id), alpha = 0.5)

library(plotly)
ggplotly(pl2)

# Proportional hazards test
off_z <- log(sum_mod$frail$z)[match(bladder1$id, sum_mod$frail$id)]

zph1 <- cox.zph(coxph(Surv(start, stop, status) ~ treatment + cluster(id), data = bladder1))

# no sign of non-proportionality
zph2 <- cox.zph(coxph(Surv(start, stop, status) ~ treatment + offset(off_z), data = bladder1))

zph2
# the p-values are even larger; the frailty "corrects" for proportionality.



