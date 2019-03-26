library(umx)


### Name: umxFactorScores
### Title: Return factor scores from a model as an easily consumable
###   dataframe.
### Aliases: umxFactorScores

### ** Examples

m1 = umxEFA(mtcars, factors = 2)
x = umxFactorScores(m1, type = c('Regression'), minManifests = 3)
## Not run: 
##D m1 = umxEFA(mtcars, factors = 1)
##D x = umxFactorScores(m1, type = c('Regression'), minManifests = 3)
##D x
## End(Not run)



