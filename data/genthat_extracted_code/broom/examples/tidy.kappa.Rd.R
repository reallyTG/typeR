library(broom)


### Name: tidy.kappa
### Title: Tidy a(n) kappa object
### Aliases: tidy.kappa kappa_tidiers psych_tidiers

### ** Examples


library(psych)

rater1 = 1:9
rater2 = c(1, 3, 1, 6, 1, 5, 5, 6, 7)
ck <- cohen.kappa(cbind(rater1, rater2))

tidy(ck)

# graph the confidence intervals
library(ggplot2)
ggplot(tidy(ck), aes(estimate, type)) +
  geom_point() +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high))




