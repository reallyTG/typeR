library(contextual)


### Name: ContextualWheelBandit
### Title: Bandit: ContextualWheelBandit
### Aliases: ContextualWheelBandit

### ** Examples

## Not run: 
##D 
##D horizon       <- 1000L
##D simulations   <- 10L
##D 
##D delta         <- 0.95
##D num_actions   <- 5
##D context_dim   <- 2
##D mean_v        <- c(1.0, 1.0, 1.0, 1.0, 1.2)
##D std_v         <- c(0.05, 0.05, 0.05, 0.05, 0.05)
##D mu_large      <- 50
##D std_large     <- 0.01
##D 
##D bandit        <- ContextualWheelBandit$new(delta, mean_v, std_v, mu_large, std_large)
##D agents        <- list(Agent$new(UCB1Policy$new(), bandit),
##D                       Agent$new(LinUCBDisjointOptimizedPolicy$new(0.6), bandit))
##D 
##D simulation     <- Simulator$new(agents, horizon, simulations)
##D history        <- simulation$run()
##D 
##D plot(history, type = "cumulative", regret = FALSE, rate = TRUE, legend_position = "bottomright")
## End(Not run)



