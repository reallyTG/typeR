library(emmeans)


### Name: pigs
### Title: Effects of dietary protein on free plasma leucine concentration
###   in pigs
### Aliases: pigs
### Keywords: datasets

### ** Examples

  pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)
  emmeans(pigs.lm, "source")



