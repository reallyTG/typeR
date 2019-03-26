library(np)


### Name: npseed
### Title: Set Random Seed
### Aliases: npseed
### Keywords: nonparametric

### ** Examples

npseed(712)
x <- runif(10)
y <- x + rnorm(10, sd = 0.1)
bw <- npregbw(y~x)



