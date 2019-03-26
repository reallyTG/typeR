library(quickpsy)


### Name: weibull_fun
### Title: Weibull function
### Aliases: weibull_fun

### ** Examples

xseq <- seq(0, 4, .01)
yseq <- weibull_fun(xseq, c(2, 4))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



