library(rafalib)


### Name: maplot
### Title: Bland Altman plot aka MA plot
### Aliases: maplot

### ** Examples

n <- 10000
signal <- runif(n,4,15)
bias <- (signal/5 - 2)^2
x <- signal + rnorm(n)
y <- signal + bias + rnorm(n)
maplot(x,y)



