library(BayesMallows)


### Name: plot_top_k
### Title: Plot Top-k Rankings with Pairwise Preferences
### Aliases: plot_top_k

### ** Examples

## Not run: 
##D   # We use the example dataset with beach preferences. Se the documentation to
##D   # compute_mallows for how to assess the convergence of the algorithm
##D   # We need to save the augmented data, so setting this option to TRUE
##D   model_fit <- compute_mallows(preferences = beach_preferences,
##D                                save_aug = TRUE)
##D   # We set burnin = 1000
##D   model_fit$burnin <- 1000
##D   # By default, the probability of being top-3 is plotted
##D   plot_top_k(model_fit)
##D   # We can also plot the probability of being top-5, for each item
##D   plot_top_k(model_fit, k = 5)
##D   # We get the underlying numbers with predict_top_k
##D   probs <- predict_top_k(model_fit)
##D   # To find all items ranked top-3 by assessors 1-3 with probability more than 80 %,
##D   # we do
##D   library(dplyr)
##D   probs %>%
##D     filter(assessor %in% 1:3, prob > 0.8)
##D 
## End(Not run)



