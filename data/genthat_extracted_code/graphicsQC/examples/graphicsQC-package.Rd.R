library(graphicsQC)


### Name: graphicsQC-package
### Title: Quality Control for Graphics
### Aliases: graphicsQC-package graphicsQC graphicsqc
### Keywords: utilities

### ** Examples

## Not run: 
##D   # Create some plots to compare (1st and 3rd plots have differences)
##D   comp1 <- plotExpr(c("plot(1:10)", "plot(4:40)", "x<-3", "plot(2:23)"),
##D                     c("pdf", "ps"), "myPrefix", "comp1")
##D   comp2 <- plotExpr(c("plot(1:11)", "plot(4:40)", "x<-3", "plot(5:15)"),
##D                     c("pdf", "ps"), "myPrefix", "comp2")
##D 
##D   # Compare them
##D   compExpr <- compare(comp1, comp2)
##D 
##D   # Write a HTML report
##D   writeReport(compExpr)
## End(Not run)



