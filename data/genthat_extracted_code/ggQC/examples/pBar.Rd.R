library(ggQC)


### Name: pBar
### Title: Mean Proportion: Binomial Data (p-chart)
### Aliases: pBar

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
n <- rpois(100, 100)
pBar(y = p/n, n = n)




