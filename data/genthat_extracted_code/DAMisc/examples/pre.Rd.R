library(DAMisc)


### Name: pre
### Title: Proportional and Expected Proportional Reductions in Error
### Aliases: pre

### ** Examples

data(france)
left.mod <- glm(voteleft ~ male + age + retnat + 
	poly(lrself, 2), data=france, family=binomial)
pre(left.mod)



