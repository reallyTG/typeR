library(cumstats)


### Name: cumquant
### Title: Cumulative Quantile
### Aliases: cumquant

### ** Examples

y <- c(9, 1, 3, 0, NA, 2, 5)
cummedian(y)
cumquant(y, 0.5)

z <- cumquant(rcauchy(10000), 0.75)
head(z); tail(z)



