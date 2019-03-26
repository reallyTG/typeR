library(flexmix)


### Name: FLXMRmgcv
### Title: FlexMix Interface to GAMs
### Aliases: FLXMRmgcv FLXMRmgcv-class
### Keywords: regression cluster

### ** Examples

set.seed(2012)
x <- seq(0, 1, length.out = 100)
z <- sample(0:1, length(x), replace = TRUE)
y <- rnorm(length(x), ifelse(z, 5 * sin(x * 2 * pi), 10 * x - 5))
fitted_model <- flexmix(y ~ s(x), model = FLXMRmgcv(),
                        cluster = z + 1,
                        control = list(tolerance = 10^-3))
plot(y ~ x, col = clusters(fitted_model))
matplot(x, fitted(fitted_model), type = "l", add = TRUE)



