library(degreenet)


### Name: simwar
### Title: Simulate from a Waring Distribution
### Aliases: simwar
### Keywords: models

### ** Examples

# Now, simulate a Waring distribution over 100
# observations with Waring with exponent 3.5 and probability of a new
# actor 0.1.

set.seed(1)
s4 <- simwar(n=100, v=c(3.5, 0.1))
table(s4)



