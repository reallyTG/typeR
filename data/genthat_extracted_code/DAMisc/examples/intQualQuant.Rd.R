library(DAMisc)


### Name: intQualQuant
### Title: Predictions for Factor-Numeric Interactions in Linear Models
### Aliases: intQualQuant

### ** Examples

library(car)
data(Prestige)
Prestige$income <- Prestige$income/1000
mod <- lm(prestige ~ income * type + education, data=Prestige)
intQualQuant(mod, c("income", "type"), n=10, 
	plot.type="none")
intQualQuant(mod, c("income", "type"), n=10, 
	plot.type="facs")
intQualQuant(mod, c("income", "type"), n=10, 
	plot.type="slopes")



