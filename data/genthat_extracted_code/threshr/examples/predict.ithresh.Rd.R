library(threshr)


### Name: predict.ithresh
### Title: Predictive inference for the largest value observed in N years.
### Aliases: predict.ithresh

### ** Examples

# Note:
#'  In the examples below validation thresholds rather higher than is
#   advisable have been used, with far fewer excesses than the minimum of
#   50 suggested by Jonathan and Ewans (2013).

# Gulf of Mexico significant wave heights, default priors.
u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4)

# Note: gom_cv$npy contains the correct value of npy (it was set in the
#       call to ithresh, via attr(gom, "npy").
#       If object$npy doesn't exist then the argument npy must be supplied
#       in the call to predict().

### Best training threshold based on the lowest validation threshold

# Predictive distribution function
best_p <- predict(gom_cv, n_years = c(100, 1000))
plot(best_p)

# Predictive density function
best_d <- predict(gom_cv, type = "d", n_years = c(100, 1000))
plot(best_d)

# See which threshold was used
summary(gom_cv)

### All thresholds plus weighted average of inferences over all thresholds

# Predictive distribution function
all_p <- predict(gom_cv, which_u = "all")
plot(all_p)

# Predictive density function
all_d <- predict(gom_cv, which_u = "all", type = "d")
plot(all_d)



