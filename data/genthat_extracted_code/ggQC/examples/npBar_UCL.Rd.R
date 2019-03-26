library(ggQC)


### Name: npBar_UCL
### Title: Upper Control Limit: Binomial Data (np-chart)
### Aliases: npBar_UCL

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
npBar_UCL(y = p, n = 30)




