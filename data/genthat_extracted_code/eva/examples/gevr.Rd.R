library(eva)


### Name: gevr
### Title: The GEVr Distribution
### Aliases: dgevr gevr pgev qgev rgevr

### ** Examples

## Plot the densities of the heavy and bounded upper tail forms of GEVr
set.seed(7)
dat1 <- rgevr(1000, 1, loc = 0, scale = 1, shape = 0.25)
dat2 <- rgevr(1000, 1, loc = 0, scale = 1, shape = -0.25)
hist(dat1, col = rgb(1, 0, 0, 0.5), xlim = c(-5, 10), ylim = c(0, 0.4),
     main = "Histogram of GEVr Densities", xlab = "Value", freq = FALSE)
hist(dat2, col = rgb(0, 0,1, 0.5), add = TRUE, freq = FALSE)
box()

## Generate sample with decreasing trend in location parameter
x <- rgevr(10, 2, loc = 10:1, scale = 1, shape = 0.1)
dgevr(x, loc = 10:1, scale = 10:1, shape = 0.1)

## Incorrect parameter specifications
# rgevr(10, 2, loc = 5:8, scale = 1, shape = 0.1)
# rgevr(1, 2, loc = 5:8, scale = 1:2, shape = 0.1)



