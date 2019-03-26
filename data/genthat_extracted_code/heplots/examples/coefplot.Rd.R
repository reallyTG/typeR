library(heplots)


### Name: coefplot
### Title: Coefficient plots for Multivariate Linear Models
### Aliases: coefplot coefplot.mlm
### Keywords: hplot

### ** Examples

mod <- lm(cbind(SAT,PPVT,Raven)~n+s+ns, data=Rohwer)

coefplot(mod, lwd=2, main="Bivariate coefficient plot for SAT and PPVT", fill=TRUE)
coefplot(mod, add=TRUE, Scheffe=TRUE, fill=TRUE)

coefplot(mod, var=c(1,3))

mod1 <- lm(cbind(SAT,PPVT,Raven)~n+s+ns+na+ss, data=Rohwer)
coefplot(mod1, lwd=2, fill=2 !=(1:5),
	main="Bivariate 68% coefficient plot for SAT and PPVT", level=0.68)




