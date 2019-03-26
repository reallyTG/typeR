library(degreenet)


### Name: simpln
### Title: Simulate from a Poisson Lognormal Distribution
### Aliases: simpln
### Keywords: models

### ** Examples

# Now, simulate a Poisson Lognormal distribution over 100
# observations with lognormal mean -1 and lognormal standard deviation 1.

set.seed(1)
s4 <- simpln(n=100, v=c(-1,1))
table(s4)



