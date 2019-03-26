library(Smisc)


### Name: pcbinom
### Title: A continuous version of the binomial cdf
### Aliases: pcbinom
### Keywords: misc

### ** Examples


x <- c(  2,   3,   5, 5.2,   5)
n <- c(  4,   5,   7,   7, 7.2)
p <- c(0.2, 0.1, 0.8, 0.8, 0.7)

pcbinom(x, n, p)
pbinom(x, n, p)

# These will work
pcbinom(c(7.3, 7.8), 12, 0.7)
pcbinom(c(7.3, 7.8), c(12,13), 0.7)
pcbinom(12.1, c(14.2,14.3), 0.6)

# But these won't
try(pcbinom(c(7.3, 7.8), c(12, 14, 16), 0.7))
try(pcbinom(c(7.3, 7.8), c(12, 14, 16), c(0.7, 0.8)))





