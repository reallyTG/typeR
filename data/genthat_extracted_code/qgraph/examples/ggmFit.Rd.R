library(qgraph)


### Name: ggmFit
### Title: Obtain fit measures of a Gaussian graphical model
### Aliases: ggmFit

### ** Examples

library("psych")

# Load BFI data:
data(bfi)
bfi <- bfi[,1:25]

# Covariance matrix:
CovMat <- cov(bfi[,1:25], use="pairwise.complete.obs")

# Compute network:
EBICgraph <- qgraph(CovMat, graph = "glasso", sampleSize = nrow(bfi),
                    tuning = 0.5, layout = "spring", title = "BIC", details = TRUE)

# Obtain fit measures:
fitNetwork <- ggmFit(EBICgraph, CovMat, nrow(bfi))
fitNetwork



