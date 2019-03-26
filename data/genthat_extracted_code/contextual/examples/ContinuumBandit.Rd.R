library(contextual)


### Name: ContinuumBandit
### Title: Bandit: ContinuumBandit
### Aliases: ContinuumBandit

### ** Examples

## Not run: 
##D 
##D horizon            <- 1500
##D simulations        <- 100
##D 
##D continuous_arms  <- function(x) {
##D   -0.1*(x - 5) ^ 2 + 3.5  + rnorm(length(x),0,0.4)
##D }
##D 
##D int_time    <- 100
##D amplitude   <- 0.2
##D learn_rate  <- 0.3
##D omega       <- 2*pi/int_time
##D x0_start    <- 2.0
##D 
##D policy             <- LifPolicy$new(int_time, amplitude, learn_rate, omega, x0_start)
##D 
##D bandit             <- ContinuumBandit$new(FUN = continuous_arms)
##D 
##D agent              <- Agent$new(policy,bandit)
##D 
##D history            <- Simulator$new(     agents = agent,
##D                                          horizon = horizon,
##D                                          simulations = simulations,
##D                                          save_theta = TRUE             )$run()
##D 
##D plot(history, type = "average", regret = FALSE)
## End(Not run)



