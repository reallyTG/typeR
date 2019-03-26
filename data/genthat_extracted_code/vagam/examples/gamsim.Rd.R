library(vagam)


### Name: gamsim
### Title: Simulate example datasets from a generalized additive models
###   (GAM).
### Aliases: gamsim
### Keywords: datagen

### ** Examples

normal_dat = gamsim(n = 40, dist = "normal", 
                    extra.X = data.frame(int = rep(1,40), trt = rep(c(0,1), each = 20)),
                    beta = c(-1, 0.5))

pois_dat = gamsim(n = 40, dist = "poisson", 
                  extra.X = data.frame(int = rep(1, 40), trt = rep(c(0,1), each = 20)),
                  beta = c(-1, 0.5))

binom_dat = gamsim(n = 40, dist = "binomial",
                   extra.X = data.frame(int = rep(1, 40), trt = rep(c(0,1), each = 20)),
                   beta = c(0, 0.5))

## Please see examples in the help file for the vagam function.



