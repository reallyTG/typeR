library(Renext)


### Name: weibplot
### Title: Classical Weibull distribution plot
### Aliases: weibplot

### ** Examples

x <- rweibull(200, shape = 1.2, scale = 1)
weibplot(x, main = "Classical Weibull plot")
## Weibull lines
weibplot(x, shape = c(0.9, 1.3), scale = 1)
weibplot(x, shape = c(0.9, 1.3), scale = 1,
         labels = c("before", "after"))
weibplot(x, shape = c(0.9, 1.3), scale = 1,
         labels = c("before", "after"),
         mono = TRUE)



