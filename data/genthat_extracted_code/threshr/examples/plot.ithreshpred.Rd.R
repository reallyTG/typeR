library(threshr)


### Name: plot.ithreshpred
### Title: Plot diagnostics an ithreshpred object
### Aliases: plot.ithreshpred

### ** Examples

u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4)

# Note: gom_cv$npy contains the correct value of npy (it was set in the
#       call to ithresh, via attr(gom, "npy").
#       If object$npy doesn't exist then the argument npy must be supplied
#       in the call to predict().

### Best training threshold based on the lowest validation threshold

# Predictive distribution function
npy_gom <- length(gom)/105
best_p <- predict(gom_cv, n_years = c(100, 1000))
plot(best_p)

# Predictive density function
best_d <- predict(gom_cv, type = "d", n_years = c(100, 1000))
plot(best_d)

### All thresholds plus weighted average of inferences over all thresholds

# Predictive distribution function
all_p <- predict(gom_cv, which_u = "all")
plot(all_p)

# Predictive density function
all_d <- predict(gom_cv, which_u = "all", type = "d")
plot(all_d)

### ... and highlight the best threshold

plot(all_p, add_best = TRUE)
plot(all_d, add_best = TRUE)



