library(mixlm)


### Name: is.balanced
### Title: Balance cheking of models.
### Aliases: is.balanced

### ** Examples

mixlm <- lm(y~x*r(z),
		    data = data.frame(y = rnorm(8),
							  x = factor(c(rep(1,4),rep(0,4))),
							  z = factor(rep(c(1,0),4))))
is.balanced(mixlm)



