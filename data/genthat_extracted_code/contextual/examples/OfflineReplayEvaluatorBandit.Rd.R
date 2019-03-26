library(contextual)


### Name: OfflineReplayEvaluatorBandit
### Title: Bandit: Li's Offline Policy Evaluator
### Aliases: OfflineReplayEvaluatorBandit

### ** Examples

## Not run: 
##D 
##D ## generate random policy log and save it
##D 
##D context_weights    <- matrix(  c( 0.9, 0.1, 0.1,
##D                                   0.1, 0.9, 0.1,
##D                                   0.1, 0.1, 0.9), nrow = 3, ncol = 3, byrow = TRUE)
##D horizon     <- 2000L
##D simulations <- 1L
##D bandit      <- ContextualBinaryBandit$new(weights = context_weights)
##D 
##D # For the generation of random data choose a random policy,
##D # otherwise rejection sampling will produce biased results.
##D 
##D policy      <- RandomPolicy$new()
##D 
##D agent       <- Agent$new(policy, bandit)
##D 
##D simulation  <-
##D   Simulator$new(
##D     agent,
##D     horizon = horizon,
##D     simulations = simulations,
##D     save_context = TRUE
##D   )
##D 
##D random_offline_data <- simulation$run()
##D random_offline_data$save("log.RData")
##D 
##D ## use saved log to evaluate policies with OfflineReplayEvaluatorBandit
##D 
##D history <- History$new()
##D history$load("log.RData")
##D log_S <- history$get_data_table()
##D 
##D bandit <- OfflineReplayEvaluatorBandit$new(offline_data = log_S, k = 3, d = 3)
##D 
##D agents <-
##D   list(
##D     Agent$new(EpsilonGreedyPolicy$new(0.01), bandit),
##D     Agent$new(LinUCBDisjointPolicy$new(0.6), bandit)
##D   )
##D 
##D simulation <-
##D   Simulator$new(
##D     agents,
##D     horizon = horizon,
##D     simulations = simulations,
##D     t_over_sims = TRUE,
##D     do_parallel = FALSE,
##D     reindex = TRUE
##D   )
##D 
##D li_bandit_history <- simulation$run()
##D 
##D plot(after, regret = FALSE, type = "cumulative", rate = TRUE)
##D 
##D if (file.exists("log.RData")) file.remove("log.RData")
##D 
## End(Not run)



