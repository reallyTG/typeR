library(copBasic)


### Name: diagCOP
### Title: The Diagonals of a Copula
### Aliases: diagCOP
### Keywords: visualization diagnostics copula (characteristics)

### ** Examples

## Not run: 
##D # The primary diagonal of the W, P, M, and PSP copulas on the same plot
##D D <- diagCOP(cop=W,   lwd=2)
##D D <- diagCOP(cop=P,   lty=2, ploton=FALSE)
##D D <- diagCOP(cop=M,   col=2, ploton=FALSE)
##D D <- diagCOP(cop=PSP, col=3, ploton=FALSE)
##D mtext("PRIMARY DIAGONAL OF SIMPLE COPULAS") # four primary diagonals 
## End(Not run)

## Not run: 
##D # The secondary diagonal of the W, P, M, and PSP copulas on the same plot
##D D <- diagCOP(cop=W,   lwd=2, secondary=TRUE)
##D D <- diagCOP(cop=P,   lty=2, secondary=TRUE, ploton=FALSE)
##D D <- diagCOP(cop=M,   col=2, secondary=TRUE, ploton=FALSE)
##D D <- diagCOP(cop=PSP, col=3, secondary=TRUE, ploton=FALSE)
##D mtext("SECONDARY DIAGONAL OF SIMPLE COPULAS") # four secondary diagonals 
## End(Not run)



