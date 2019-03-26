library(extremefit)


### Name: plot.hill
### Title: Hill plot
### Aliases: plot.hill

### ** Examples

x <- abs(rcauchy(100))
hh <- hill(x)
par(mfrow = c(2, 1))
plot(hh, xaxis = "ranks")
plot(hh, xaxis = "xsort")




