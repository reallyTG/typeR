library(latdiag)


### Name: draw.latent
### Title: Draw latent scale diagram
### Aliases: draw.latent print.draw.latent plot.draw.latent
### Keywords: hplot

### ** Examples

set.seed(20150114)
mat <- cbind(
   sample(0:1, 100, prob = c(0.2, 0.8), replace = TRUE),
   sample(0:1, 100, prob = c(0.4, 0.6), replace = TRUE),
   sample(0:1, 100, prob = c(0.5, 0.5), replace = TRUE),
   sample(0:1, 100, prob = c(0.6, 0.4), replace = TRUE),
   sample(0:1, 100, prob = c(0.8, 0.2), replace = TRUE)
)
res <- draw.latent(mat, rootname = "mat")
#
# now need to plot(res, graphtype = "png")
#



