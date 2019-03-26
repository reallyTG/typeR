library(mixlm)


### Name: AnovaMix
### Title: Mixed model least squares analysis of variance (mixed ANOVA).
### Aliases: AnovaMix
### Keywords: ANOVA

### ** Examples

mydata <- data.frame(y = rnorm(12),
							  x = factor(c(rep(2,4),rep(1,4),rep(0,4))),
							  z = factor(rep(c(1,0),6)))
mixlm <- lm(y~x*r(z),
			data = mydata)
Anova(mixlm,type="III")



