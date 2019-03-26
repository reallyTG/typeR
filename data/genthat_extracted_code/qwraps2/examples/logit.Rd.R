library(qwraps2)


### Name: logit
### Title: logit and inverse logit functions
### Aliases: logit invlogit

### ** Examples

library(qwraps2)
library(rbenchmark)

# compare logit to qlogis
p <- runif(1e5)
identical(logit(p), qlogis(p)) 
benchmark(logit(p), qlogis(p))

# compare invlogit to plogis
x <- runif(1e5, -1000, 1000)
identical(invlogit(x), plogis(x))
benchmark(invlogit(x), plogis(x))




