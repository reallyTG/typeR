library(palm)


### Name: fit.twocamera
### Title: Estimation of animal density from two-camera surveys.
### Aliases: fit.twocamera

### ** Examples

## Fitting model.
fit <- fit.twocamera(points = example.twocamera$points, cameras = example.twocamera$cameras,
                     d = 500, w = 0.175, b = 0.5, l = 20, tau = 110, R = 1)
## Printing estimates.
coef(fit)
## Plotting the estimated Palm intensity.
plot(fit)




