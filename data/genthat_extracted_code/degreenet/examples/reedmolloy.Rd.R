library(degreenet)


### Name: reedmolloy
### Title: Generate a (non-random) network with a given degree sequence
### Aliases: reedmolloy
### Keywords: models

### ** Examples

# Now, simulate a Poisson Lognormal distribution over 100
# observations with mean = -1 and s.d. = 1.

set.seed(2)
s4 <- simpln(n=100, v=c(-1,1))
table(s4)
#
simr <- reedmolloy(s4)
simr



