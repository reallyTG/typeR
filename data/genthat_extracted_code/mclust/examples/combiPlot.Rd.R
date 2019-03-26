library(mclust)


### Name: combiPlot
### Title: Plot Classifications Corresponding to Successive Combined
###   Solutions
### Aliases: combiPlot
### Keywords: cluster

### ** Examples

## Not run: 
##D data(Baudry_etal_2010_JCGS_examples)
##D MclustOutput <- Mclust(ex4.1) 
##D 
##D MclustOutput$G # Mclust/BIC selected 6 classes
##D 
##D par(mfrow=c(2,2))
##D 
##D combiM0 <- diag(6) # is the identity matrix
##D # no merging: plot the initial solution, given by z
##D combiPlot(ex4.1, MclustOutput$z, combiM0, cex = 3) 
##D title("No combining")
##D 
##D combiM1 <- combMat(6, 1, 2) # let's merge classes labeled 1 and 2
##D combiM1
##D combiPlot(ex4.1, MclustOutput$z, combiM1)
##D title("Combine 1 and 2")
##D 
##D # let's merge classes labeled 1 and 2, and then components labeled (in this 
##D # new 5-classes combined solution...) 1 and 2
##D combiM2 <- combMat(5, 1, 2) %*% combMat(6, 1, 2) 
##D combiM2 
##D combiPlot(ex4.1, MclustOutput$z, combiM2)
##D title("Combine 1, 2 and then 1 and 2 again")
##D 
##D plot(0,0,type="n", xlab = "", ylab = "", axes = FALSE)
##D legend("center", legend = 1:6,
##D        col = mclust.options("classPlotColors"), 
##D        pch = mclust.options("classPlotSymbols"), 
##D        title = "Class labels:")
## End(Not run)



