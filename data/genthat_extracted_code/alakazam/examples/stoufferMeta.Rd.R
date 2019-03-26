library(alakazam)


### Name: stoufferMeta
### Title: Weighted meta-analysis of p-values via Stouffer's method
### Aliases: stoufferMeta

### ** Examples

# Define p-value and weight vectors
p <- c(0.1, 0.05, 0.3)
w <- c(5, 10, 1)

# Unweighted
stoufferMeta(p)

# Weighted
stoufferMeta(p, w)




