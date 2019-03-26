library(dMod)


### Name: funC0
### Title: Evaluation of algebraic expressions defined by characters
### Aliases: funC0

### ** Examples

library(ggplot2)
myfun <- funC0(c(y = "a*x^4 + b*x^2 + c"))
out <- myfun(a = -1, b = 2, c = 3, x = seq(-2, 2, .1), attach.input = TRUE)
qplot(x = x, y = y, data = as.data.frame(out), geom = "line")



