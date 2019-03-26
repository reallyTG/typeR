library(ggQC)


### Name: npBar_LCL
### Title: Lower Control Limit: Binomial Data (np-chart)
### Aliases: npBar_LCL

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
npBar_LCL(y = p, n = 30)




