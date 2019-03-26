library(dae)


### Name: blockboundaryPlot
### Title: This function plots a block boundary on a plot produced by
###   'designPlot'.
### Aliases: blockboundaryPlot
### Keywords: design plot

### ** Examples
## Not run: 
##D     SPL.Lines.mat <- matrix(as.numfac(Lines), ncol=16, byrow=T)
##D     colnames(SPL.Lines.mat) <- 1:16
##D     rownames(SPL.Lines.mat) <- 1:10
##D     SPL.Lines.mat <- SPL.Lines.mat[10:1, 1:16]
##D     designPlot(SPL.Lines.mat, labels=1:10, new=TRUE,
##D                rtitle="Rows",ctitle="Columns", 
##D                chardivisor=3, rcellpropn = 1, ccellpropn=1,
##D                plotcellboundary = TRUE)
##D     #Plot Mainplot boundaries
##D     blockboundaryPlot(blockdefinition = cbind(4,16), rstart = 1, 
##D                       blocklinewidth = 3, blockcolour = "green", 
##D                       nrows = 9, ncolumns = 16)
##D     blockboundaryPlot(blockdefinition = cbind(1,4), 
##D                       blocklinewidth = 3, blockcolour = "green", 
##D                       nrows = 1, ncolumns = 16)
##D     blockboundaryPlot(blockdefinition = cbind(1,4), rstart= 9, nrows = 10, ncolumns = 16, 
##D                       blocklinewidth = 3, blockcolour = "green")
##D     #Plot all 4 block boundaries            
##D     blockboundaryPlot(blockdefinition = cbind(8,5,5,4), blocksequence=T, 
##D                       cstart = 1, rstart= 1, nrows = 9, ncolumns = 15, 
##D                       blocklinewidth = 3,blockcolour = "blue")
##D     blockboundaryPlot(blockdefinition = cbind(10,16), blocklinewidth=3, blockcolour="blue", 
##D                       nrows=10, ncolumns=16)
##D     #Plot border and internal block boundaries only
##D     blockboundaryPlot(blockdefinition = cbind(8,14), cstart = 1, rstart= 1, 
##D                       nrows = 9, ncolumns =  15,
##D                       blocklinewidth = 3, blockcolour = "blue")
##D     blockboundaryPlot(blockdefinition = cbind(10,16), 
##D                       blocklinewidth = 3, blockcolour = "blue", 
##D                       nrows = 10, ncolumns = 16)
## End(Not run)


