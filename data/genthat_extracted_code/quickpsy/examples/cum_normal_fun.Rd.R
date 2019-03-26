library(quickpsy)


### Name: cum_normal_fun
### Title: Cumulative normal function
### Aliases: cum_normal_fun

### ** Examples

xseq <- seq(0,4,.01)
yseq <- cum_normal_fun(xseq, c(2, .5))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



