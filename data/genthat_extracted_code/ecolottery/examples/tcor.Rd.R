library(ecolottery)


### Name: tcor
### Title: Generates Correlated Traits
### Aliases: tcor
### Keywords: trait distribution trait correlation

### ** Examples

# With no predefined trait
traits <- tcor(n = 10000, rho = 0.8)
plot(traits[, 1], traits[, 2])
cor(traits[, 1], traits[, 2])

# With existing trait
existing_trait <- rnorm(10000, 10, 1)
traits <- tcor(n = 10000, rho = 0.8, x = existing_trait)
plot(traits[, 1], traits[, 2])
cor(traits[, 1], traits[, 2])



