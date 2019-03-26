library(SpatialVx)


### Name: optflow
### Title: Optical Flow
### Aliases: optflow
### Keywords: math regression

### ** Examples

x <- y <- matrix(0, 10, 10)
x[1:2,3:4] <- 1
y[3:4,5:6] <- 2

optflow(x,y)

## Not run: 
##D initial <- hump$initial
##D final <- hump$final
##D look <- OF(final, initial, W=9, verbose=TRUE)
##D plot(look) # Compare with Fig. 1 in Marzban and Sandgathe (2010).
##D hist(look) # 2-d histogram.
##D plot(look, full=TRUE) # More plots.
## End(Not run)



