library(contextual)


### Name: BasicGaussianBandit
### Title: Bandit: BasicGaussianBandit
### Aliases: BasicGaussianBandit

### ** Examples

## Not run: 
##D 
##D horizon            <- 100
##D sims               <- 100
##D 
##D policy             <- EpsilonGreedyPolicy$new(epsilon = 0.1)
##D 
##D bandit             <- BasicGaussianBandit$new(c(0,0,1), c(1,1,1))
##D agent              <- Agent$new(policy,bandit)
##D 
##D history            <- Simulator$new(agent, horizon, sims)$run()
##D 
##D plot(history, type = "cumulative", regret = TRUE)
##D 
## End(Not run)



