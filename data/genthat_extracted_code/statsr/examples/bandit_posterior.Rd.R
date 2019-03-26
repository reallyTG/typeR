library(statsr)


### Name: bandit_posterior
### Title: bandit posterior
### Aliases: bandit_posterior

### ** Examples

data = data.frame(machine = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L), 
                  outcome = c("W", "L", "W", "L", "L", "W", "L", "L", "L", "W"))
bandit_posterior(data)
plot_bandit_posterior(data)




