library(spBayes)


### Name: Zurich.dat
### Title: Zurichberg Forest inventory data
### Aliases: Zurich.dat
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Zurich.dat)
##D 
##D coords <- Zurich.dat[,c("X_TREE", "Y_TREE")]
##D 
##D spp.name <- c("beech","maple","ash","other broadleaves",
##D               "spruce","silver fir", "larch", "other coniferous")
##D 
##D spp.col <- c("yellow","red","orange","pink",
##D              "green","dark green","black","gray")
##D                  
##D plot(coords, col=spp.col[Zurich.dat$SPP+1],
##D      pch=19, cex=0.5, ylab="Northing", xlab="Easting")
##D 
##D legend.coords <- c(23,240)
##D 
##D legend(legend.coords, pch=19, legend=spp.name,
##D        col=spp.col, bty="n")
##D 
##D 
## End(Not run)



