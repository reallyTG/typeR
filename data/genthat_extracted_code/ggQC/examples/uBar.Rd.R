library(ggQC)


### Name: uBar
### Title: Mean Rate: Count Data (u-chart)
### Aliases: uBar

### ** Examples

set.seed(5555)
counts <- rpois(100, 25)
n <- rpois(100, 15)
uBar(y = counts / n, n = n)




