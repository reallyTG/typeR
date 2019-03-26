library(cwhmisc)


### Name: mult.fig.p
### Title: Plot Setup for multiple plot, incl. main title
### Aliases: mult.fig.p
### Keywords: hplot

### ** Examples

## Not run: 
##D AA <- mult.fig.p(5, main= "Sine functions of different frequencies")
##D x <- seq(0, 1, len = 201)
##D for (n in 1:5)
##D   plot(x, sin(n * pi * x), ylab ="", main = paste("n = ",n))
##D par(AA$old.par)
##D 
##D rr <- mult.fig.p(mfrow=c(4,2), main= "Sine functions", cex = 1.5,
##D                marP = - c(0, 1, 2, 0))
##D for (n in 1:8)
##D   plot(x, sin(n * pi * x), type = 'l', col="red", ylab ="")
##D str(rr)
##D par(rr$old.par)
##D ## Look at the par setting *AFTER* the above:
##D str(do.call("par", as.list(names(rr$new.par))))
## End(Not run)



