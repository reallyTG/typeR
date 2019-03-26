library(contextual)


### Name: SoftmaxPolicy
### Title: Policy: Softmax
### Aliases: SoftmaxPolicy

### ** Examples


horizon            <- 100L
simulations        <- 100L
weights          <- c(0.9, 0.1, 0.1)

policy             <- SoftmaxPolicy$new(tau = 0.1)
bandit             <- BasicBernoulliBandit$new(weights = weights)
agent              <- Agent$new(policy, bandit)

history            <- Simulator$new(agent, horizon, simulations, do_parallel = FALSE)$run()

plot(history, type = "cumulative")

plot(history, type = "arms")



