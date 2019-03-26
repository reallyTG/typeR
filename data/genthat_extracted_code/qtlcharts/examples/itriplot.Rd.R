library(qtlcharts)


### Name: itriplot
### Title: Interactive plot of trinomial probabilities
### Aliases: itriplot
### Keywords: hplot

### ** Examples

n <- 100
p <- matrix(runif(3*n), ncol=3)
p <- p / colSums(p)
g <- sample(1:3, n, replace=TRUE)
## No test: 
itriplot(p, group=g)
## End(No test)




