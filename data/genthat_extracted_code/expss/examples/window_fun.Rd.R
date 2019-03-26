library(expss)


### Name: window_fun
### Title: Function over grouping variables (window function)
### Aliases: window_fun

### ** Examples

window_fun(1:3, mean)  # no grouping -> grand mean

attach(warpbreaks)

window_fun(breaks, wool, mean)
window_fun(breaks, tension, function(x) mean(x, trim = 0.1))

detach(warpbreaks)



