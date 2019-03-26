library(mixlm)


### Name: anova.lmm
### Title: Analysis of variance (sequential SS)
### Aliases: anova.lmm anova
### Keywords: ANOVA

### ** Examples

mixlm <- lm(y~x*r(z),
			data = data.frame(y = rnorm(8),
							  x = factor(c(rep(1,4),rep(0,4))),
							  z = factor(rep(c(1,0),4))))
anova(mixlm)



