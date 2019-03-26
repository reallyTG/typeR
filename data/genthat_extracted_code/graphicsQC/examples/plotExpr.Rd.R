library(graphicsQC)


### Name: plotExpr
### Title: Plot arbitrary code
### Aliases: plotExpr plotFile plotFunction plotPackage
### Keywords: utilities

### ** Examples

## Not run: 
##D   # plotExpr example:
##D   example1 <- plotExpr(c("plot(1:10)", "plot(4:40)", "x<-3", "plot(2:23)"),
##D                        c("pdf", "ps"), "example1", "myPrefix")
##D   # There should now be a folder "example1" in the current
##D   # working directory containing pdf and ps files and myPrefix-log.xml, ie
##D   list.files("example1")
##D 
##D   # plotFunction example:
##D   example2 <- plotFunction(c("plot", "barplot", "hist"), c("pdf", "ps"),
##D                            path = "example2")
##D   list.files("example2")
##D 
##D   # A bigger example:
##D   # require(grid)
##D   # gridExample <- plotFunction(ls("package:grid"), c("pdf", "png", "ps"),
##D   #                             path = "gridExample")
## End(Not run)



