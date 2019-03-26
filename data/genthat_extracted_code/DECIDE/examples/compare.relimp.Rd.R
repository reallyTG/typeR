library(DECIDE)


### Name: compare.relimp
### Title: Compare estimates of log odds, log odds ratios and relative
###   importance obtained by two datasets
### Aliases: compare.relimp

### ** Examples

# generate two datasets
set.seed(1)
data1 <- data.frame(seq(1:10), rep(c(1, 2), length.out = 10), 
c(rep(0, times = 3), rep(1, times = 7)), 
c(rnorm(4, 0, 1), rnorm(4, 0.5, 1), NA, NA))

data2 <- data.frame(seq(1:10), rep(c(1, 2), length.out = 10), 
c(rep(0, times = 5), rep(1, times = 5)), 
c(rnorm(5, 1, 1), rnorm(5, 0.5, 1)))

# run function
compare.relimp(data1, data2)



