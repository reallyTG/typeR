library(ggQC)


### Name: pBar_UCL
### Title: Upper Control Limit: Binomial Data (p-chart)
### Aliases: pBar_UCL

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
n <- rpois(100, 100)
pBar_UCL(y = p/n, n = n)




