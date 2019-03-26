library(PMCMRplus)


### Name: welchManyOneTTest
### Title: Welchs's Many-To-One Comparison Test
### Aliases: welchManyOneTTest welchManyOneTTest.default
###   welchManyOneTTest.formula
### Keywords: htest

### ** Examples

set.seed(245)
mn <- rep(c(1, 2^(1:4)), each=5)
sd <- rep(1:5, each=5)
x <- mn + rnorm(25, sd = sd)
g <- factor(rep(1:5, each=5))

fit <- aov(x ~ g)
shapiro.test(residuals(fit))
bartlett.test(x ~ g) # var1 != varN
anova(fit)
summary(welchManyOneTTest(x, g, alternative = "greater", p.adjust="holm"))




