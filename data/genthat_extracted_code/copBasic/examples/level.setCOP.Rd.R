library(copBasic)


### Name: level.setCOP
### Title: Compute a Level Set of a Copula V with respect to U
### Aliases: level.setCOP
### Keywords: visualization diagnostics

### ** Examples

## Not run: 
##D set <- level.setCOP(cop=PSP, getlevel=0.23, delu=0.005)
##D level.curvesCOP(cop=PSP)
##D lines(set$U, set$V, col=2, lwd=2) # manually draw the 23rd percentile
##D set <- level.setCOP(cop=PSP, para=3.1, getlevel=0.67, lines=TRUE, col=4, lwd=4)
##D # Notice the change in the lines argument and using levelsetCOP2 to draw.
##D mtext("Level Curves and Special Level Sets for PSP copula") # 
## End(Not run)



