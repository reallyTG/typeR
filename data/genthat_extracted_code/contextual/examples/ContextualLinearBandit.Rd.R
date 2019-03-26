library(contextual)


### Name: ContextualLinearBandit
### Title: Bandit: ContextualLinearBandit
### Aliases: ContextualLinearBandit

### ** Examples

## Not run: 
##D 
##D horizon       <- 800L
##D simulations   <- 30L
##D 
##D bandit        <- ContextualLinearBandit$new(k = 5, d = 5)
##D 
##D agents        <- list(Agent$new(EpsilonGreedyPolicy$new(0.1), bandit),
##D                       Agent$new(LinUCBDisjointOptimizedPolicy$new(0.6), bandit))
##D 
##D simulation     <- Simulator$new(agents, horizon, simulations)
##D history        <- simulation$run()
##D 
##D plot(history, type = "cumulative", regret = FALSE, rate = TRUE, legend_position = "right")
## End(Not run)



