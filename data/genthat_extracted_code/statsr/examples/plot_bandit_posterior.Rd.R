library(statsr)


### Name: plot_bandit_posterior
### Title: plot_bandit_posterior
### Aliases: plot_bandit_posterior

### ** Examples

# capture data from the `shiny` app `bandit_sim`.
data = data.frame(machine = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L), 
                  outcome = c("W", "L", "W", "L", "L", "W", "L", "L", "L", "W"))
plot_bandit_posterior(data)




