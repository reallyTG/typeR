library(GGUM)


### Name: GUM
### Title: Fit the graded unfolding model (GUM)
### Aliases: GUM

### ** Examples

# Generate data:
gen <- GenData.GGUM(400, 5, 3, "GUM", seed = 139)
# Fit the GUM:
fit <- GUM(gen$data, 3)
# Compare true and estimated item parameters:
cbind(gen$delta, fit$delta)
cbind(c(gen$taus[, 5:7]), c(fit$taus[,  5:7]))




