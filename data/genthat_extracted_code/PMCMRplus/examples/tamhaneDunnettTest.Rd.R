library(PMCMRplus)


### Name: tamhaneDunnettTest
### Title: Tamhane-Dunnett Many-to-One Comparison Test
### Aliases: tamhaneDunnettTest tamhaneDunnettTest.default
###   tamhaneDunnettTest.formula
### Keywords: htest

### ** Examples

set.seed(245)
mn <- c(1, 2, 2^2, 2^3, 2^4)
x <- rep(mn, each=5) + rnorm(25)
g <- factor(rep(1:5, each=5))

fit <- aov(x ~ g - 1)
shapiro.test(residuals(fit))
bartlett.test(x ~ g - 1)
anova(fit)
summary(tamhaneDunnettTest(x, g, alternative = "greater"))




