library(copBasic)


### Name: level.setCOP2
### Title: Compute a Level Set of a Copula U with respect to V
### Aliases: level.setCOP2
### Keywords: visualization diagnostics

### ** Examples

## Not run: 
##D set <- level.setCOP2(cop=N4212cop, para=3.1, getlevel=0.23, delu=0.005)
##D level.curvesCOP2(cop=N4212cop, para=3.1, delv=0.001, delt=0.02)
##D lines(set$U, set$V, col=2, lwd=2) # manually draw the 23rd percentile
##D set <- level.setCOP2(cop=N4212cop, para=3.1, getlevel=0.17, lines=TRUE, col=4, lwd=4)
##D # Notice the change in the lines argument and using levelsetCOP2 to draw. 
##D mtext("Level Curves and Special Level Sets for N4212 copula") #
## End(Not run)



