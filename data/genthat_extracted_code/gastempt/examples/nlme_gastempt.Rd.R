library(gastempt)


### Name: nlme_gastempt
### Title: Simplified population fit of gastric emptying data
### Aliases: nlme_gastempt

### ** Examples

set.seed(4711)
d = simulate_gastempt(n_record = 10, kappa_mean = 0.9, kappa_std = 0.3,
                      model = linexp)$data
fit_d = nlme_gastempt(d)
# fit_d$coef # direct access
coef(fit_d) # better use accessor function
coef(fit_d, signif = 3) # Can also set number of digits
# Avoid ugly ggplot shading (not really needed...)
library(ggplot2)
theme_set(theme_bw() + theme(panel.spacing = grid::unit(0,"lines")))
# fit_d$plot  # direct access is possible
plot(fit_d) # better use accessor function



