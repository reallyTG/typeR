library(gginference)


### Name: ggproptest
### Title: Plot test of Equal or Given Proportions
### Aliases: ggproptest

### ** Examples


x  <- c(5, 8, 12)
y <- c(8, 9, 13)
pr_test <- prop.test(x, y)
pr_test
ggproptest(pr_test)




