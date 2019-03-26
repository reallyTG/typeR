library(rotations)


### Name: plot.SO3
### Title: Visualizing random rotations
### Aliases: plot.Q4 plot.SO3

### ** Examples

r <- rvmises(200, kappa = 1.0)
Rs <- genR(r)

plot(Rs, center = mean(Rs), show_estimates = "proj.mean", shape = 4)

## Not run: 
##D # Z is computed internally and contains information on depth
##D plot(Rs, center = mean(Rs), show_estimates = c("proj.mean", "geom.mean"),
##D  label_points = sample(LETTERS, 200, replace = TRUE)) + aes(size = Z, alpha = Z) +
##D  scale_size(limits = c(-1, 1), range = c(0.5, 2.5))
##D 
##D plot(Rs, center = mean(Rs), interactive = TRUE)
## End(Not run)



