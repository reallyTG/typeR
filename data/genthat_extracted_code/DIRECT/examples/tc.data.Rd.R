library(DIRECT)


### Name: tc.data
### Title: Time-Course Microarray Gene Expression Data
### Aliases: tc.data
### Keywords: datasets

### ** Examples

## Not run: 
##D # Compute mean profiles for genes
##D # and plot the means as a heatmap with the color scale on the side
##D 
##D library (fields)	# to use function image.plot
##D 
##D data (tc.data)
##D times = c(0,5,10,15,20,25,30,35,40,50,60,70,80,90,100,110,120,150)
##D 
##D # Organize data into array of nGene-by-nTime-by-nRep
##D SKIP=2
##D nTime=length (times)
##D nGene = nrow (tc.data)
##D nRep = (ncol (tc.data) - SKIP) / nTime
##D 
##D ts = array (0, dim = c(nGene, nTime, nRep))
##D for (r in 1:nRep) {
##D     ts[,,r] = as.matrix (tc.data[,SKIP + (0:(nTime-1))*nRep + r])
##D }
##D 
##D # Compute mean profile for each gene
##D ts.mean = apply (ts, c(1,2), mean)
##D 
##D # Plot heatmap for mean profiles
##D image.plot (1:nGene, times, as.matrix(ts.mean), 
##D     xlab="gene", ylab="time (min)", 
##D     cex=1.5, cex.axis = 1.6, cex.lab = 1.6, 
##D     legend.shrink=1, legend.width=2, col=topo.colors(8))
## End(Not run)



