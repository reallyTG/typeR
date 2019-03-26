library(pracma)


### Name: errorbar
### Title: Plot Error Bars
### Aliases: errorbar
### Keywords: graphs

### ** Examples

## Not run: 
##D x <- seq(0, 2*pi, length.out = 20)
##D y <- sin(x)
##D xe <- 0.1
##D ye <- 0.1 * y
##D errorbar(x, y, xe, ye, type = "l", with = FALSE)
##D 
##D cnt <- round(100*randn(20, 3))
##D y <- apply(cnt, 1, mean)
##D e <- apply(cnt, 1, sd)
##D errorbar(1:20, y, yerr = e, bar.col = "blue")
## End(Not run)



