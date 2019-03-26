library(TauStar)


### Name: tStar
### Title: Computing t*
### Aliases: tStar

### ** Examples

## Not run: 
##D library(TauStar)
##D 
##D # Compute t* for a concordant quadruple
##D tStar(c(1,2,3,4), c(1,2,3,4)) # == 2/3
##D 
##D # Compute t* for a discordant quadruple
##D tStar(c(1,2,3,4), c(1,-1,1,-1)) # == -1/3
##D 
##D # Compute t* on random normal iid normal data
##D set.seed(23421)
##D tStar(rnorm(4000), rnorm(4000)) # near 0
##D 
##D # Compute t* as a v-statistic
##D set.seed(923)
##D tStar(rnorm(100), rnorm(100), vStatistic = TRUE)
##D 
##D # Compute an approximation of tau* via resampling
##D set.seed(9492)
##D tStar(rnorm(10000), rnorm(10000), resample = TRUE, sampleSize = 30,
##D       numResamples = 5000)
## End(Not run)



