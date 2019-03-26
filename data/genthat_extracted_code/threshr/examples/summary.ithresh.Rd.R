library(threshr)


### Name: summary.ithresh
### Title: Summarizing measures of threshold predictive performance
### Aliases: summary.ithresh

### ** Examples

u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n_v = 4)
summary(gom_cv)



