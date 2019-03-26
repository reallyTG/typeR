library(graphicsQC)


### Name: compare
### Title: Compare graphics output
### Aliases: compare compareExpr compareFun compareFile
### Keywords: utilities

### ** Examples

## Not run: 
##D   # Create sets to compare (1st and 3rd are different)
##D   comp1 <- plotExpr(c("plot(1:10)", "plot(4:40)", "x<-3", "plot(2:23)"),
##D                     c("pdf", "ps"), "myPrefix", "comp1")
##D   comp2 <- plotExpr(c("plot(1:11)", "plot(4:40)", "x<-3", "plot(5:15)"),
##D                     c("pdf", "ps"), "myPrefix", "comp2")
##D   compExpr <- compare(comp1, comp2)
##D   # All the diff output has been placed in "comp1" (the test directory)
##D   compExpr
##D   # For a better way of viewing this, see ?writeReport
## End(Not run)



