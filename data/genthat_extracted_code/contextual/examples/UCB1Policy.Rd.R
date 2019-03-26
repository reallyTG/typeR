library(contextual)


### Name: UCB1Policy
### Title: Policy: UCB1
### Aliases: UCB1Policy

### ** Examples


horizon            <- 100L
simulations        <- 100L
weights          <- c(0.9, 0.1, 0.1)

policy             <- UCB1Policy$new()
bandit             <- BasicBernoulliBandit$new(weights = weights)
agent              <- Agent$new(policy, bandit)

history            <- Simulator$new(agent, horizon, simulations, do_parallel = FALSE)$run()

plot(history, type = "cumulative")

plot(history, type = "arms")



