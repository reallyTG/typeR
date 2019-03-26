library(mixlm)


### Name: print.AnovaMix
### Title: Print method for objects of class(AnovaMix)
### Aliases: print.AnovaMix print
### Keywords: ANOVA

### ** Examples

mixlm <- lm(y~x*r(z),
			data = data.frame(y = rnorm(8),
							  x = factor(c(rep(1,4),rep(0,4))),
							  z = factor(rep(c(1,0),4))))
Anova(mixlm,type="III")



