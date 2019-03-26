library(TauStar)


### Name: TauStar-package
### Title: Efficient Computation and Testing of the t* Statistic of Bergsma
###   and Dassios
### Aliases: TauStar TauStar-package

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
##D tStar(rnorm(100), rnorm(100), vStatistic=TRUE)
##D 
##D # Compute an approximation of tau* via resampling
##D set.seed(9492)
##D tStar(rnorm(10000), rnorm(10000),
##D       resample=TRUE, sampleSize=30, numResamples=5000)
##D 
##D # Perform a test of independence using continuous data
##D set.seed(123)
##D x = rnorm(100)
##D y = rnorm(100)
##D testResults = tauStarTest(x,y)
##D print(testResults$pVal) # big p-value
##D 
##D # Now make x and y correlated so we expect a small p-value
##D y = y + x
##D testResults = tauStarTest(x,y)
##D print(testResults$pVal) # small p-value
## End(Not run)




