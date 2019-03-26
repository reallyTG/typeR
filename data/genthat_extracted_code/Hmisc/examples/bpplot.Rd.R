library(Hmisc)


### Name: bpplot
### Title: Box-percentile plots
### Aliases: bpplot
### Keywords: nonparametric hplot

### ** Examples

set.seed(1)
x1 <- rnorm(500)
x2 <- runif(500, -2, 2)
x3 <- abs(rnorm(500))-2
bpplot(x1, x2, x3)
g <- sample(1:2, 500, replace=TRUE)
bpplot(split(x2, g), name=c('Group 1','Group 2'))
rm(x1,x2,x3,g)



