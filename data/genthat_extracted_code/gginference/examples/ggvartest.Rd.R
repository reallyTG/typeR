library(gginference)


### Name: ggvartest
### Title: F test plot
### Aliases: ggvartest

### ** Examples


x <- rnorm(50, mean = 0, sd = 2)
y <- rnorm(30, mean = 1, sd = 1)
var_test <- var.test(x, y)
var_test
ggvartest(var_test)




