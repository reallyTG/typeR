library(BayesMallows)


### Name: generate_initial_ranking
### Title: Generate Initial Ranking
### Aliases: generate_initial_ranking

### ** Examples

# The example dataset beach_preferences contains pairwise prefences of beach.
# We must first generate the transitive closure
beach_tc <- generate_transitive_closure(beach_preferences)

# Next, we generate an initial ranking
beach_init <- generate_initial_ranking(beach_tc)

# Look at the first few rows:
head(beach_init)

# We can add more informative column names in order
# to get nicer posterior plots:
colnames(beach_init) <- paste("Beach", seq(from = 1, to = ncol(beach_init), by = 1))
head(beach_init)

## Not run: 
##D   # We now give beach_init and beach_tc to compute_mallows. We tell compute_mallows
##D   # to save the augmented data, in order to study the convergence.
##D   model_fit <- compute_mallows(rankings = beach_init,
##D                                preferences = beach_tc,
##D                                nmc = 2000,
##D                                save_aug = TRUE)
##D 
##D   # We can study the acceptance rate of the augmented rankings
##D   assess_convergence(model_fit, parameter = "Rtilde")
##D 
##D   # We can also study the posterior distribution of the consensus rank of each beach
##D   model_fit$burnin <- 500
##D   plot(model_fit, parameter = "rho", items = 1:15)
## End(Not run)



