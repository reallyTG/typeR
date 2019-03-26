library(doRNG)


### Name: doRNGversion
### Title: Back Compatibility Option for doRNG
### Aliases: doRNGversion

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


## Don't show: 
 registerDoSEQ() 
## End(Don't show)

## Seeding when current RNG is L'Ecuyer-CMRG
RNGkind("L'Ecuyer")

doRNGversion("1.4")
# in version >= 1.4 seeding behaviour changed to fix a bug
set.seed(123)
res <- foreach(i=1:3) %dorng% runif(1)
res2 <- foreach(i=1:3) %dorng% runif(1)
stopifnot( !identical(attr(res, 'rng')[2:3], attr(res2, 'rng')[1:2]) )
res3 <- foreach(i=1:3, .options.RNG=123) %dorng% runif(1)
stopifnot( identical(res, res3) )

# buggy behaviour in version < 1.4
doRNGversion("1.3")
res <- foreach(i=1:3) %dorng% runif(1)
res2 <- foreach(i=1:3) %dorng% runif(1)
stopifnot( identical(attr(res, 'rng')[2:3], attr(res2, 'rng')[1:2]) )
res3 <- foreach(i=1:3, .options.RNG=123) %dorng% runif(1)
stopifnot( !identical(res, res3) )

# restore default RNG  
RNGkind("default")
# restore to current doRNG version
doRNGversion(NULL)




