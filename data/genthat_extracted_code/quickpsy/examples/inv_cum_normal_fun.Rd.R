library(quickpsy)


### Name: inv_cum_normal_fun
### Title: Inverse cumulative normal function
### Aliases: inv_cum_normal_fun

### ** Examples

yseq <- seq(0, 1, .01)
xseq <- inv_cum_normal_fun(yseq, c(2, .5))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



