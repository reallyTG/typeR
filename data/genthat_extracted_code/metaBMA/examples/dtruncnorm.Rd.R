library(metaBMA)


### Name: dtruncnorm
### Title: Truncated Normal Distribution
### Aliases: dtruncnorm rtruncnorm

### ** Examples

samples <- rtruncnorm(1e5, -.5, 3, 1, 1)
hist(samples, 200, freq = FALSE)
curve(dtruncnorm(x, -.5, 3, 1, 1), -2,4,
      col = 2, lwd = 2, add = TRUE, n = 301)



