library(mixlm)


### Name: Anova.lmm
### Title: Analysis of variance with SS type II or III (including mixed
###   models).
### Aliases: Anova Anova.lmm
### Keywords: ANOVA

### ** Examples

dataset <- data.frame(y = rnorm(8),
  x = factor(c(rep(1,4),rep(0,4))),
  z = factor(rep(c(1,0),4)))
mixlm <- lm(y~x*r(z),
  data = dataset)
Anova(mixlm, type="III")



