library(BayesMallows)


### Name: estimate_partition_function
### Title: Estimate Partition Function
### Aliases: estimate_partition_function

### ** Examples

## Not run: 
##D   # IMPORTANCE SAMPLING
##D   # Let us estimate logZ(alpha) for 20 items with Spearman distance
##D   # We create a grid of alpha values from 0 to 10
##D   alpha_vector <- seq(from = 0, to = 10, by = 0.5)
##D   n_items <- 20
##D   metric <- "spearman"
##D   degree <- 10
##D 
##D   # We start with 1e3 Monte Carlo samples
##D   fit1 <- estimate_partition_function(method = "importance_sampling",
##D                                         alpha_vector = alpha_vector,
##D                                         n_items = n_items, metric = metric,
##D                                         nmc = 1e3, degree = degree)
##D   # A vector of polynomial regression coefficients is returned
##D   fit1
##D 
##D   # Now let us recompute with 1e4 Monte Carlo samples
##D   fit2 <- estimate_partition_function(method = "importance_sampling",
##D                                       alpha_vector = alpha_vector,
##D                                       n_items = n_items, metric = metric,
##D                                       nmc = 1e4, degree = degree)
##D 
##D   # ASYMPTOTIC APPROXIMATION
##D   # We can also compute an estimate using the asymptotic approximation
##D   K <- 20
##D   n_iterations <- 50
##D 
##D   fit3 <- estimate_partition_function(method = "asymptotic",
##D                                       alpha_vector = alpha_vector,
##D                                       n_items = n_items, metric = metric,
##D                                       n_iterations = n_iterations,
##D                                       K = K, degree = degree)
##D 
##D   # We write a little function for storing the estimates in a dataframe
##D   library(dplyr)
##D   powers <- seq(from = 0, to = degree, by = 1)
##D 
##D   compute_fit <- function(fit){
##D     tibble(alpha = alpha_vector) %>%
##D       rowwise() %>%
##D       mutate(logz_estimate = sum(alpha^powers * fit))
##D   }
##D 
##D   estimates <- bind_rows(
##D     "Importance Sampling 1e3" = compute_fit(fit1),
##D     "Importance Sampling 1e4" = compute_fit(fit2),
##D     "Asymptotic" = compute_fit(fit3),
##D     .id = "type")
##D 
##D   # We can now plot the two estimates side-by-side
##D   library(ggplot2)
##D   ggplot(estimates, aes(x = alpha, y = logz_estimate, color = type)) +
##D     geom_line()
##D   # We see that the two importance sampling estimates, which are unbiased,
##D   # overlap. The asymptotic approximation seems a bit off. It can be worthwhile
##D   # to try different values of n_iterations and K.
##D 
##D   # When we are happy, we can provide the coefficient vector in the
##D   # logz_estimate argument to compute_mallows
##D   # Say we choose to use the importance sampling estimate with 1e4 Monte Carlo samples:
##D   model_fit <- compute_mallows(potato_visual, metric = "spearman",
##D                                logz_estimate = fit2)
##D 
## End(Not run)



