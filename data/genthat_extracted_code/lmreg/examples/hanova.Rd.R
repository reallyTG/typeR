library(lmreg)


### Name: hanova
### Title: ANOVA table for adequacy of a subset in a linear model)
### Aliases: hanova
### Keywords: htest model design regression

### ** Examples

data(birthwt)
lmbw <- lm(BWT ~ SMOKE+factor(RACE), data = birthwt)
lm1 <- lm(BWT ~ SMOKE, data = birthwt)
hanova(lm1,lmbw)



