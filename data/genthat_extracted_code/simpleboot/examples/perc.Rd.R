library(simpleboot)


### Name: perc
### Title: Extract percentiles from a bootstrap sampling distribution.
### Aliases: perc perc.lm
### Keywords: univar

### ** Examples

x <- rnorm(100)
b <- one.boot(x, median, R = 1000)
perc(b, c(.90, .95, .99))



