library(simukde)


### Name: simulate_kde
### Title: Simulation with Kernel Density Estimation
### Aliases: simulate_kde

### ** Examples

## 1-dimensional data
data(faithful)
hist(faithful$eruptions)
res <- simukde::simulate_kde(x = faithful$eruptions, n = 100, parallel = FALSE)
hist(res$random.values)

## Simulation with the best fitting instrumental distribution
data(faithful)
par(mfrow = c(1, 3))
hist(faithful$eruptions)
fit <- simukde::find_best_fit(x = faithful$eruptions, positive = TRUE)
res <- simukde::simulate_kde(
  x = faithful$eruptions, n = 100,
  distr = fit$distribution, parallel = FALSE
)
hist(res$random.values)
par(mfrow = c(1, 1))
## No test: 
## 2-dimensional data
data(faithful)
res <- simukde::simulate_kde(x = faithful, n = 100)
plot(res$kde, display = "filled.contour2")
points(x = res$random.values, cex = 0.25, pch = 16, col = "green")
points(x = faithful, cex = 0.25, pch = 16, col = "black")
## End(No test)
## Don't show: 
## 2-dimensional data
data(faithful)
res <- simukde::simulate_kde(x = faithful, n = 1, parallel = FALSE)
plot(res$kde, display = "filled.contour2")
points(x = res$random.values, cex = 0.5, pch = 16, col = "blue")
points(x = faithful, cex = 0.25, pch = 16, col = "gray")
## End(Don't show)



