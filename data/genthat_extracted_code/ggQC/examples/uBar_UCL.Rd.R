library(ggQC)


### Name: uBar_UCL
### Title: Upper Control Limit: Count Data (u-chart)
### Aliases: uBar_UCL

### ** Examples

set.seed(5555)
counts <- rpois(100, 25)
n <- rpois(100, 15)
uBar_UCL(y = counts / n, n = n)




