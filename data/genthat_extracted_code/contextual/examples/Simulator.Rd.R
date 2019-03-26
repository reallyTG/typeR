library(contextual)


### Name: Simulator
### Title: Simulator
### Aliases: Simulator run simulator

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
##D 
##D   summary(history)
##D 
##D   plot(history)
##D 
##D   dt <- history$get_data_table()
##D 
##D   df <- history$get_data_frame()
##D 
##D   print(history$cumulative$E.G.$cum_regret_sd)
##D 
##D   print(history$cumulative$E.G.$cum_regret)
##D 
## End(Not run)




