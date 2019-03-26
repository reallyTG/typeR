library(contextual)


### Name: ContextualHybridBandit
### Title: Bandit: ContextualHybridBandit
### Aliases: ContextualHybridBandit

### ** Examples

## Not run: 
##D 
##D horizon       <- 800L
##D simulations   <- 100L
##D 
##D bandit        <- ContextualHybridBandit$new(k = 100, shared_features = 10, unique_features = 2)
##D 
##D agents        <- list(Agent$new(ContextualThompsonSamplingPolicy$new(delta=0.5,
##D                                                    R=0.01, epsilon=0.5), bandit),
##D                       Agent$new(EpsilonGreedyPolicy$new(0.1), bandit),
##D                       Agent$new(LinUCBGeneralPolicy$new(0.6), bandit),
##D                       Agent$new(ContextualEpochGreedyPolicy$new(8), bandit),
##D                       Agent$new(LinUCBHybridOptimizedPolicy$new(0.6), bandit),
##D                       Agent$new(LinUCBDisjointOptimizedPolicy$new(0.6), bandit))
##D 
##D simulation     <- Simulator$new(agents, horizon, simulations)
##D history        <- simulation$run()
##D 
##D plot(history, type = "cumulative", regret = FALSE, rate = TRUE, legend_position = "bottomright")
## End(Not run)




