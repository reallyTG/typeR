library(copula)


### Name: Bernoulli
### Title: Compute Bernoulli Numbers
### Aliases: Bernoulli Bernoulli.all
### Keywords: arith

### ** Examples

## The example for the paper
MASS::fractions(Bernoulli.all(8, verbose=TRUE))

B10 <- Bernoulli.all(10)
MASS::fractions(B10)

system.time(B50  <- Bernoulli.all(50))#  {does not cache} -- still "no time"
system.time(B100 <- Bernoulli.all(100))# still less than a milli second

## Using Bernoulli() is not much slower, but hopefully *more* accurate!
## Check first - TODO
system.time(B.1c <- Bernoulli(100))# caches ..
system.time(B1c. <- Bernoulli(100))# ==> now much faster
stopifnot(identical(B.1c, B1c.))

if(FALSE)## reset the cache:
assign("Bern.tab", list(), envir = copula:::.nacopEnv)

## More experiments in the source of the copula package ../tests/Stirling-etc.R



