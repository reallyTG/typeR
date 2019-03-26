library(pubh)


### Name: rank_leverage
### Title: Ranks observations by leverage.
### Aliases: rank_leverage

### ** Examples

x <- rnorm(10, 170, 8)
x
mean(x)
rank_leverage(x)

x <- rnorm(100, 170, 8)
mean(x)
head(rank_leverage(x))



