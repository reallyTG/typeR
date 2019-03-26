library(PMCMRplus)


### Name: tukeyTest
### Title: Tukey's Test
### Aliases: tukeyTest tukeyTest.default tukeyTest.formula
### Keywords: htest

### ** Examples

set.seed(245)
mn <- rep(c(1, 2^(1:4)), each=5)
sd <- rep(1, 25)
x <- mn + rnorm(25, sd = sd)
g <- factor(rep(1:5, each=5))

fit <- aov(x ~ g)
shapiro.test(residuals(fit))
bartlett.test(x ~ g) # var1 = varN
anova(fit)
summary(tukeyTest(x, g))



