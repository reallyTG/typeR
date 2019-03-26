library(DAMisc)


### Name: glmChange2
### Title: Maximal First Differences for Generalized Linear Models
### Aliases: glmChange2

### ** Examples

data(france)
left.mod <- glm(voteleft ~ male + age + retnat + 
	poly(lrself, 2), data=france, family=binomial)
typical.france <- data.frame(
	retnat = factor(1, levels=1:3, labels=levels(france$retnat)), 
	age = 35
	)
glmChange2(left.mod, "age", data=france, "sd")



