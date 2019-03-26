library(pcensmix)


### Name: run_pcensmix
### Title: Generating Progressively Type-II Censored Mixture Data and
###   Fitting a Model
### Aliases: run_pcensmix

### ** Examples

## Not run: 
##D 
##D ## Example 1: with very well separated mixture components
##D set.seed(3)
##D f1 <- run_pcensmix(N = 160, r = 120, p = 0.3, param = c(10, 2, 25, 4, 0.3), repetition = 100)
##D colMeans(f1)
##D 
##D ## Example 2.
##D set.seed(150)
##D f2 <- run_pcensmix(N = 160, r = 130, p = 0.35, param = c(10, 2, 17, 4, 0.3), repetition = 100)
##D colMeans(f2)
##D 
##D ## Example 3.
##D set.seed(20)
##D f3 <- run_pcensmix(N = 160, r = 130, p = 0.3, param = c(20, 6, 22, 12, 0.6), repetition = 100)
##D colMeans(f3)
##D 
## End(Not run)




