library(DAMisc)


### Name: binfit
### Title: Scalar Measures of Fit for Binary Variable Models
### Aliases: binfit

### ** Examples

data(france)
left.mod <- glm(voteleft ~ male + age + retnat + 
	poly(lrself, 2), data=france, family=binomial)
binfit(left.mod)



