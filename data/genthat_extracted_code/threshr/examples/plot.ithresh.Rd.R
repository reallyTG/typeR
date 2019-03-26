library(threshr)


### Name: plot.ithresh
### Title: Plot diagnostics an ithresh object
### Aliases: plot.ithresh

### ** Examples

# [Smoother plots result from making n larger than the default n = 1000.]

# Threshold diagnostic plot
u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4)
plot(gom_cv, lwd = 2, add_legend = TRUE, legend_pos = "topleft")
mtext("significant wave height / m", side = 3, line = 2.5)

# Plot of Generalized Pareto posterior sample at the best threshold
# (based on the lowest validation threshold)
plot(gom_cv, which_u = "best")
# See which threshold was used
summary(gom_cv)

# Plot of Generalized Pareto posterior sample at the highest threshold
n_u <- length(u_vec_gom)
plot(gom_cv, which_u = n_u, points_par = list(pch = 20, col = "grey"))



