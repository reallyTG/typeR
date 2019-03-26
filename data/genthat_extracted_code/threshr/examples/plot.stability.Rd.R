library(threshr)


### Name: plot.stability
### Title: Plot diagnostics for a stability object
### Aliases: plot.stability

### ** Examples

u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))
gom_stab <- stability(data = gom, u_vec = u_vec_gom)
plot(gom_stab)



