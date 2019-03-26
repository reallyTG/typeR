library(DAMisc)


### Name: glmChange
### Title: Maximal First Differences for Generalized Linear Models
### Aliases: glmChange

### ** Examples

data(france)
left.mod <- glm(voteleft ~ male + age + retnat + 
	poly(lrself, 2), data=france, family=binomial)
typical.france <- data.frame(
	retnat = factor(1, levels=1:3, labels=levels(france$retnat)), 
	age = 35
	)
glmChange(left.mod, data=france, typical.dat=typical.france)



