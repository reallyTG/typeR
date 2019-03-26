library(eva)


### Name: gevrRl
### Title: GEVr Return Level Estimate and Confidence Interval for
###   Stationary Models
### Aliases: gevrRl

### ** Examples

x <- rgevr(100, 2, loc = 0.5, scale = 1, shape = -0.3)
z <- gevrFit(x)
## Compute 250-period return level.
gevrRl(z, 250, method = "delta")



