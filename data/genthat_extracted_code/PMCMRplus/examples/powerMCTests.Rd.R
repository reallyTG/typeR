library(PMCMRplus)


### Name: powerMCTests
### Title: Power Simulation for One-Factorial All-Pairs and Many-To-One
###   Comparison Tests
### Aliases: powerMCTests
### Keywords: misc

### ** Examples

## Not run: 
##D mu <- c(0, 0, 1, 2)
##D n <- c(5, 4, 5, 5)
##D set.seed(100)
##D powerMCTests(mu, n, errfn="Normal",
##D  parms=list(mean=0, sd=1),
##D  test="dunnettTest", replicates=1E4)
##D 
##D powerMCTests(mu, n, errfn="Normal",
##D  parms=list(mean=0, sd=1),
##D  test="kwManyOneDunnTest", p.adjust.method = "bonferroni",
##D  replicates=1E4)
##D 
## End(Not run)




