library(pracma)


### Name: histss
### Title: Histogram Bin-width Optimization
### Aliases: histss
### Keywords: timeseries

### ** Examples

x <- sin(seq(0, pi/2, length.out = 200))
H <- histss(x, n = 50, plotting = FALSE)
## Not run: 
##D plot(H, col = "gainsboro")  # Compare with hist(x), or
##D hist(x, breaks = H$breaks)  # the same 
## End(Not run)



