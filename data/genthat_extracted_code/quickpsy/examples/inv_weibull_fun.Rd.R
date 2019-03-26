library(quickpsy)


### Name: inv_weibull_fun
### Title: Inverse Weibull function
### Aliases: inv_weibull_fun

### ** Examples

yseq <- seq(0, 1, .01)
xseq <- inv_weibull_fun(yseq, c(2, 4))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



