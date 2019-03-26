library(pauwels2014)


### Name: log_normalize
### Title: Normalize in log space
### Aliases: log_normalize

### ** Examples

log_x <- rnorm(10)

temp <- log_normalize(log_x)

exp(temp[[2]]) - temp[[1]]

sum(exp(temp[[2]]))

log_x - temp[[3]] - temp[[2]]




