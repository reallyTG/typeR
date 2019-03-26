library(dafs)


### Name: printCI
### Title: Produce a formatted confidence interval
### Aliases: printCI
### Keywords: Book

### ** Examples

n = 100
x = rnorm(n)
mx = mean(x)
se = sd(x)/sqrt(n)
ci = mx + qnorm(c(0.025,0.975))*se
printCI(ci, '%5.2f')



