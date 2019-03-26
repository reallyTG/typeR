library(pwrRasch)


### Name: simul.rasch
### Title: Simulate data according to the Rasch model
### Aliases: simul.rasch

### ** Examples

## Not run: 
##D 
##D # simulate Rasch model based data
##D # 100 persons, 20 items,
##D # person parameter drawn from a normal distribution: N(0,1.5)
##D # item parameters equally spaced between [-3, 3]
##D simul.rasch(100, items = 20)
##D 
##D # simulate Rasch model based data
##D # 100 persons, 17 items
##D # person parameter drawn from a uniform distribution: U[-4, 4]
##D # item parameters: [-4.0, -3.5, -3.0, ... , 3.0, 3.5, 4.0]
##D simul.rasch(runif(100, -4, 4), items = seq(-4, 4, by = 0.5))
## End(Not run)



