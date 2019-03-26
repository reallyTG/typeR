library(gMCP)


### Name: gMCP-package
### Title: Graphical described Multiple Comparison Procedures
### Aliases: gMCP-package
### Keywords: package graphs htest

### ** Examples

g5 <- BonferroniHolm(5)
## Not run: 
##D graphGUI("g5")
## End(Not run)
gMCP(g5, pvalues=c(0.1,0.2,0.4,0.4,0.4))



