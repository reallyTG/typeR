library(degreenet)


### Name: simcmp
### Title: Simulate from a Conway Maxwell Poisson Distribution
### Aliases: simcmp
### Keywords: models

### ** Examples

# Now, simulate a Conway Maxwell Poisson distribution over 100
# observations with lognormal mean -1 and lognormal standard deviation 1.

set.seed(1)
s4 <- simcmp(n=100, v=c(7,3))
table(s4)



