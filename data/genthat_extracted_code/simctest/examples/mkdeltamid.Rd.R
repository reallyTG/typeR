library(simctest)


### Name: mkdeltamid
### Title: Function mkdeltamid in Package 'simctest'
### Aliases: mkdeltamid

### ** Examples

## only care about powers around 0.9 or higher
## (e.g. if want to check that the test is powerful enough).

deltamid <- mkdeltamid(mindelta=0.02, maxdelta=1, llim=0, rlim=0.9)

genstream <- function(){p <- runif(1); function(N){runif(N) <= p}}

## The power is 0.05. The algorithm should stop as soon as it is clear
## that the power is not larger than 0.9. (Must specify epsilon
## if using non-standard delta.)

res <- mcp(genstream, alpha=0.05, delta="adaptive", cp=0.99,
options=list(deltamid = deltamid, epsilon = 0.0001))

##should stop early.
res



