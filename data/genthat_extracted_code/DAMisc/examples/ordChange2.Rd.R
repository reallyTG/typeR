library(DAMisc)


### Name: ordChange2
### Title: Average Effects for Proportional Odds Logistic Regression Models
### Aliases: ordChange2

### ** Examples

library(MASS)
data(france)
polr.mod <- polr(vote ~ age + male + retnat + lrself, data=france)
typical.france <- data.frame(
	age = 35, 
	retnat = factor(1, levels=1:3, labels=levels(france$retnat))
	)
ordChange2(polr.mod, "age", data=france, diffchange="sd")	



