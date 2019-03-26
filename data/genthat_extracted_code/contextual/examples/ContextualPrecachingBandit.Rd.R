library(contextual)


### Name: ContextualPrecachingBandit
### Title: Bandit: ContextualPrecachingBandit
### Aliases: ContextualPrecachingBandit

### ** Examples

## Not run: 
##D 
##D horizon            <- 100L
##D simulations        <- 100L
##D 
##D # rows represent features, columns represent arms:
##D 
##D context_weights    <- matrix(  c(0.4, 0.2, 0.4,
##D                                  0.3, 0.4, 0.3,
##D                                  0.1, 0.8, 0.1),  nrow = 3, ncol = 3, byrow = TRUE)
##D 
##D bandit             <- ContextualPrecachingBandit$new(weights)
##D 
##D agents             <- list( Agent$new(EpsilonGreedyPolicy$new(0.1), bandit),
##D                             Agent$new(LinUCBDisjointOptimizedPolicy$new(0.6), bandit))
##D 
##D simulation         <- Simulator$new(agents, horizon, simulations)
##D history            <- simulation$run()
##D 
##D plot(history, type = "cumulative")
##D 
## End(Not run)



