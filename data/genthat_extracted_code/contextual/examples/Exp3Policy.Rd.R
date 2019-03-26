library(contextual)


### Name: Exp3Policy
### Title: Policy: Exp3
### Aliases: Exp3Policy

### ** Examples


horizon            <- 100L
simulations        <- 100L
weights          <- c(0.9, 0.1, 0.1)

policy             <- Exp3Policy$new(gamma = 0.1)
bandit             <- BasicBernoulliBandit$new(weights = weights)
agent              <- Agent$new(policy, bandit)

history            <- Simulator$new(agent, horizon, simulations, do_parallel = FALSE)$run()

plot(history, type = "cumulative")

plot(history, type = "arms")



