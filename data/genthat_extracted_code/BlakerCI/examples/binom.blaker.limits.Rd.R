library(BlakerCI)


### Name: binom.blaker.limits
### Title: Blaker's binomial confidence limits
### Aliases: binom.blaker.limits
### Keywords: htest

### ** Examples

binom.blaker.limits(3,10) # [1] 0.08726443 0.61941066

## Example of a failure of the original algorithm:
## Requires PropCIs package.
## Tolerance 1e-4 - default in the Blaker's paper.
## Not run: 
##D blakerci(29,99,conf.level=0.95,tolerance=1e-4) ## [1] 0.2096386 0.3923087
##D ## The correct upper limit should be 0.3929...,
##D ## as demonstrated:
##D ## (1) By the same function with a smaller tolerance:
##D blakerci(29,99,conf.level=0.95,tolerance=1e-7) ## [1] 0.2097022 0.3929079
##D ## (2) By binom.blaker.limits 
##D ##     (default confidence limit 0.95, default tolerance 1e-10):
##D binom.blaker.limits(29,99) ## [1] 0.2097022 0.3929079
##D ## (3) By exactbinomCI function from package exactci
##D ##     (default confidence level, default tolerance): 
##D exactbinomCI(29,99,tsmethod="blaker")[1:2] ## [1] 0.2097 0.3929
##D ## The same function, smaller tolerance:
##D exactbinomCI(29,99,tsmethod="blaker",tol=1e-8)[1:2] 
##D                                                 ## [1] 0.2097022 0.3929079
##D 
##D ## Another example of a failure of the original algorithm 
##D ## with even as small tolerance as 1e-6:
##D blakerci(59,355,conf.level=0.95,tolerance=1e-4) ## [1] 0.1299899 0.2085809
##D blakerci(59,355,conf.level=0.95,tolerance=1e-5) ## [1] 0.1300799 0.2085409
##D blakerci(59,355,conf.level=0.95,tolerance=1e-6) ## [1] 0.1300799 0.2085349
##D ## Only for tolerance = 1e-7 the result is satisfactory
##D ## and in agreement with binom.blaker.limits:
##D blakerci(59,355,conf.level=0.95,tolerance=1e-7) ## [1] 0.1300807 0.2090809
##D binom.blaker.limits(59,355)                     ## [1] 0.1300807 0.2090809
## End(Not run)






