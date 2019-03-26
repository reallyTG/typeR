library(semPower)


### Name: semPower.aPriori
### Title: semPower.aPriori
### Aliases: semPower.aPriori

### ** Examples

## Not run: 
##D power <- semPower.aPriori(effect = .05, effect.measure = "RMSEA", alpha = .05, beta = .05, df = 200)
##D power
##D power <- semPower.aPriori(effect = .15, effect.measure = "F0", alpha = .05, power = .80, df = 100)
##D power
##D power <- semPower.aPriori(alpha = .01, beta = .05, df = 5, 
##D                           SigmaHat = diag(4), Sigma = cov(matrix(rnorm(4*1000),  ncol=4)))
##D power
## End(Not run)



