library(simFrame)


### Name: sampling
### Title: Random sampling
### Aliases: srs ups brewer midzuno tille
### Keywords: distribution

### ** Examples

## simple random sampling
# without replacement
srs(10, 5)
# with replacement
srs(5, 10, replace = TRUE)

## unequal probability sampling
# without replacement
ups(10, 5, prob = 1:10)
# with replacement
ups(5, 10, prob = 1:5, replace = TRUE)

## Brewer, Midzuno and Tille sampling
# define inclusion probabilities
prob <- c(0.2,0.7,0.8,0.5,0.4,0.4)
# Brewer sampling
brewer(prob)
# Midzuno sampling
midzuno(prob)
# Tille sampling
tille(prob)



