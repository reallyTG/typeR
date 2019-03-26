library(ggQC)


### Name: npBar
### Title: Mean Value: Binomial Data (np-chart)
### Aliases: npBar

### ** Examples

set.seed(5555)
p <- rbinom(n = 100, size = 30, prob = .2)
npBar(y = p, n = 30)




