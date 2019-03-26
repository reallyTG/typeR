library(quickpsy)


### Name: logistic_fun
### Title: Logistic function
### Aliases: logistic_fun

### ** Examples

xseq <- seq(0, 4, .01)
yseq <- logistic_fun(xseq, c(2, 4))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



