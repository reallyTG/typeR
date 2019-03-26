library(contextual)


### Name: ContextualLogitBandit
### Title: Bandit: ContextualLogitBandit
### Aliases: ContextualLogitBandit

### ** Examples

## Not run: 
##D 
##D horizon       <- 800L
##D simulations   <- 30L
##D 
##D bandit        <- ContextualLogitBandit$new(k = 5, d = 5, intercept = TRUE)
##D 
##D agents        <- list(Agent$new(ContextualThompsonSamplingPolicy$new(delta=0.5,
##D                                                        R=0.01, epsilon=0.5), bandit),
##D                       Agent$new(EpsilonGreedyPolicy$new(0.1), bandit),
##D                       Agent$new(LinUCBGeneralPolicy$new(0.6), bandit),
##D                       Agent$new(ContextualEpochGreedyPolicy$new(8), bandit),
##D                       Agent$new(LinUCBHybridOptimizedPolicy$new(0.6), bandit),
##D                       Agent$new(LinUCBDisjointOptimizedPolicy$new(0.6), bandit))
##D 
##D simulation     <- Simulator$new(agents, horizon, simulations)
##D history        <- simulation$run()
##D 
##D plot(history, type = "cumulative", regret = FALSE,
##D               rate = TRUE, legend_position = "right")
## End(Not run)



