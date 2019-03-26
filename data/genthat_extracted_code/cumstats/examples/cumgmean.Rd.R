library(cumstats)


### Name: cumgmean
### Title: Cumulative Geometric Mean
### Aliases: cumgmean

### ** Examples

cumgmean(c(9, 1, 4, 0, 3, NA, 8, 5))

z <- cumgmean(rlnorm(10000, 0, 1))
head(z); tail(z)



