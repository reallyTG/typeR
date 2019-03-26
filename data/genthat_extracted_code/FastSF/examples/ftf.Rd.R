library(FastSF)


### Name: ftf
### Title: Fast Trend Filtering
### Aliases: ftf

### ** Examples

set.seed(1)

sigma <- 0.5
y0 <- c((10:30)/3, (40:10)/4, 2:8)
y <- y0 + sigma*rnorm(length(y0))
re <- ftf(y, k = 1, s = 5)





