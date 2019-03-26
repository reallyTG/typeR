library(DAMisc)


### Name: ordChange
### Title: Maximal First Differences for Proportional Odds Logistic
###   Regression Models
### Aliases: ordChange

### ** Examples

library(MASS)
data(france)
polr.mod <- polr(vote ~ age + male + retnat + lrself, data=france)
typical.france <- data.frame(
	age = 35, 
	retnat = factor(1, levels=1:3, labels=levels(france$retnat))
	)
ordChange(polr.mod, data=france, typical.dat=typical.france, sim=FALSE)	



