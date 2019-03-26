library(PMCMRplus)


### Name: dunnettTest
### Title: Dunnett's Many-to-One Comparisons Test
### Aliases: dunnettTest dunnettTest.default dunnettTest.formula
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
summary(dunnettTest(x, g, alternative = "greater"))




