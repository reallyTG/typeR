library(desiR)


### Name: des.line
### Title: Plots a desirability function on an existing graph
### Aliases: des.line

### ** Examples

set.seed(1)
x1 <- rnorm(100, 10, 2)
hist(x1, breaks=10)
des.line(x1, "d.high", des.args=c(cut1=10, cut2=11))
des.line(x1, "d.high", des.args=c(cut1=10, cut2=11,
des.min=0.1, scale=0.5))



