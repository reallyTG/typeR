library(car)


### Name: influencePlot
### Title: Regression Influence Plot
### Aliases: influencePlot influencePlot.lm influence.plot
### Keywords: regression

### ** Examples

influencePlot(lm(prestige ~ income + education, data=Duncan))
## Not run: 
##D influencePlot(lm(prestige ~ income + education, data=Duncan), 
##D     id=list(method="identify"))
## End(Not run)



