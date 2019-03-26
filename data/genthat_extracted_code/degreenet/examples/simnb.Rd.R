library(degreenet)


### Name: simnb
### Title: Simulate from a Negative Binomial Distribution
### Aliases: simnb
### Keywords: models

### ** Examples

# Now, simulate a Negative Binomial distribution over 100
# observations with lognormal mean -1 and lognormal standard deviation 1.

set.seed(1)
s4 <- simnb(n=100, v=c(5,0.2))
table(s4)



