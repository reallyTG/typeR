library(quickpsy)


### Name: inv_logistic_fun
### Title: Inverse logistic function
### Aliases: inv_logistic_fun

### ** Examples

yseq <- seq(0, 1, .01)
xseq <- inv_logistic_fun(yseq, c(2, 4))
curve <- data.frame(x = xseq, y = yseq)
ggplot(curve, aes(x = x, y = y)) + geom_line()



