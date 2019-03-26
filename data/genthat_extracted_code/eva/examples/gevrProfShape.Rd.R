library(eva)


### Name: gevrProfShape
### Title: GEVr Shape Parameter Profile Likelihood Estimation for
###   Stationary Models
### Aliases: gevrProfShape

### ** Examples

## Compare the length of the shape confidence intervals using GEV1 vs. GEV10
set.seed(7)
x <- rgevr(200, 10, loc = 0.5, scale = 1, shape = -0.3)
z1 <- gevrFit(x[, 1])
z2 <- gevrFit(x)
gevrProfShape(z1)
gevrProfShape(z2)



