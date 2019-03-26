library(contextual)


### Name: ContextualThompsonSamplingPolicy
### Title: Policy: Contextual Thompson Sampling with Linear Payoffs
### Aliases: ContextualThompsonSamplingPolicy

### ** Examples

## Not run: 
##D 
##D horizon            <- 1000L
##D simulations        <- 10L
##D 
##D bandit             <- ContextualLogitBandit$new(k = 5, d = 5)
##D 
##D delta              <- 0.5
##D R                  <- 0.01
##D epsilon            <- 0.5
##D 
##D policy             <- ContextualThompsonSamplingPolicy$new(delta, R, epsilon)
##D 
##D agent              <- Agent$new(policy, bandit)
##D 
##D simulation         <- Simulator$new(agents, horizon, simulations)
##D history            <- simulation$run()
##D 
##D plot(history, type = "cumulative", regret = FALSE, rate = TRUE)
## End(Not run)



