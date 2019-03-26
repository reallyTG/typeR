library(ggQC)


### Name: uBar_LCL
### Title: Lower Control Limit: Count Data (u-chart)
### Aliases: uBar_LCL

### ** Examples

set.seed(5555)
counts <- rpois(100, 25)
n <- rpois(100, 15)
uBar_LCL(y = counts / n, n = n)



