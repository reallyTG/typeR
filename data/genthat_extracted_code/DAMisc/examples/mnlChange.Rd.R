library(DAMisc)


### Name: mnlChange
### Title: Maximal First Differences for Multinomial Logistic Regression
###   Models
### Aliases: mnlChange

### ** Examples

library(nnet)
data(france)
mnl.mod <- multinom(vote ~ age + male + retnat + lrself, data=france)
typical.france <- data.frame(
	age = 35, 
	retnat = factor(1, levels=1:3, labels=levels(france$retnat))
	)
mnlChange(mnl.mod, data=france, typical.dat=typical.france)	



