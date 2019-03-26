library(onls)


### Name: plot.onls
### Title: Plotting function for 'onls' objects
### Aliases: plot.onls
### Keywords: models nonlinear

### ** Examples

## Quadratic model with 10% added noise.
## Omitting the "nls" curve,
## display orthogonal segments.
x <- 1:20
y <- 10 + 3*x^2
y <- sapply(y, function(a) rnorm(1, a, 0.1 * a))
DAT <- data.frame(x, y)
mod <- onls(y ~ a + b * x^2, data = DAT, start = list(a = 1, b = 1))
plot(mod, fitted.nls = FALSE)

## Due to different scaling, 
## orthogonality of fit is not evident.
## We need to have equal x/y-scaling for that:
plot(mod, fitted.nls = FALSE, xlim = c(0, 50),
     ylim = c(0, 50))



