library(contextual)


### Name: Agent
### Title: Agent
### Aliases: Agent do_step get_t set_t agent

### ** Examples

## Not run: 
##D 
##D   policy    <- EpsilonGreedyPolicy$new(epsilon = 0.1)
##D   bandit    <- BasicBernoulliBandit$new(weights = c(0.6, 0.1, 0.1))
##D 
##D   agent     <- Agent$new(policy, bandit, name = "E.G.", sparse = 0.5)
##D 
##D   history   <- Simulator$new(agents = agent,
##D                              horizon = 10,
##D                              simulations = 10)$run()
## End(Not run)



