library(validann)


### Name: plot.validann
### Title: Plot ANN validation results.
### Aliases: plot.validann

### ** Examples

## Build ANN model and compute replicative and structural validation results
data("ar9")
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]
fit <- ann(x, y, size = 1, act_hid = "tanh", act_out = "linear", rang = 0.1)
results <- validann(fit, x = x)
obs <- observed(fit)
sim <- fitted(fit)

## Plot replicative and structural validation results to the current device
## - a single page for each type of validation
plot(results, obs, sim)

## Plot results to the current device - a single page for each plot
plot(results, obs, sim, display = "single")

## Plot replicative and structural validation results to single file
pdf("RepStructValidationPlots.pdf")
plot(results, obs, sim)
dev.off()

## Get predictive validation results for above model based on a new sample
## of ar9 data.
samp <- sample(1:1000, 200)
y <- ar9[samp, ncol(ar9)]
x <- ar9[samp, -ncol(ar9)]
x <- x[, c(1,4,9)]
obs <- y
sim <- predict(fit, newdata = x)
results <- validann(fit, obs = obs, sim = sim, x = x)

## Plot predictive results only to file
pdf("PredValidationPlots.pdf")
plot(results, obs, sim, resid = FALSE, sa = FALSE)
dev.off()




