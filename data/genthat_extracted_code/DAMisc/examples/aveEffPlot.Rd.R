library(DAMisc)


### Name: aveEffPlot
### Title: Average Effect Plot for Generalized Linear Models
### Aliases: aveEffPlot

### ** Examples

data(france)
p <- poly(france$lrself, 2)
left.mod <- glm(voteleft ~ male + age + retnat + 
	poly(lrself, 2, coefs=attr(p, "coefs")), data=france, family=binomial)
aveEffPlot(left.mod, "age", data=france, plot=FALSE)



