library(ggQC)


### Name: pBar_LCL
### Title: Lower Control Limit: Binomial Data (p-chart)
### Aliases: pBar_LCL

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
n <- rpois(100, 100)
pBar_LCL(y = p/n, n = n)




