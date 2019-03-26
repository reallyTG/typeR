library(degreenet)


### Name: simyule
### Title: Simulate from a Yule Distribution
### Aliases: simyule
### Keywords: models

### ** Examples

# Now, simulate a Yule distribution over 100
# observations with rho=4.0

set.seed(1)
s4 <- simyule(n=100, rho=4)
table(s4)



