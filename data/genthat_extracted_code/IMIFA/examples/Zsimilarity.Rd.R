library(IMIFA)


### Name: Zsimilarity
### Title: Summarise MCMC samples of clustering labels with a similarity
###   matrix and find the 'average' clustering
### Aliases: Zsimilarity
### Keywords: utility

### ** Examples

# Run a IMIFA model and extract the sampled cluster labels
# data(olive)
# sim    <- mcmc_IMIFA(olive, method="IMIFA", n.iters=5000)
# zs     <- sim[[1]][[1]]$z.store

# Get the similarity matrix and visualise it
# zsimil <- Zsimilarity(zs)
# z.sim  <- as.matrix(zsimil$z.sim)
# z.col  <- mat2cols(z.sim, cols=heat.colors(30)[30:1])
# z.col[z.sim == 0] <- NA
# plot_cols(z.col, na.col=par()$bg); box(lwd=2)

# Extract the clustering with minimum squared distance to this
# 'average' and evaluate its performance against the true labels
# table(zsimil$z.avg, olive$area)

# Perform hierarchical clustering on the distance matrix
# Hcl    <- hclust(as.dist(1 - z.sim), method="complete")
# plot(Hcl)
# table(cutree(Hcl, k=3), olive$area)



