library(PMCMRplus)


### Name: gamesHowellTest
### Title: Games-Howell Test
### Aliases: gamesHowellTest gamesHowellTest.default
###   gamesHowellTest.formula
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
summary(gamesHowellTest(x, g))



