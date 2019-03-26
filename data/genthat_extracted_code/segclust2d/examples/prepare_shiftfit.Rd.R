library(segclust2d)


### Name: prepare_shiftfit
### Title: Prepare shiftfit output for proper comparison plots
### Aliases: prepare_shiftfit

### ** Examples

## Not run: 
##D data(simulshift)
##D # 1. subsample to a reasonable size
##D subdata <- simulshift[seq(1,30000,by = 100),]
##D # 2. use algorithm from marcher package
##D MWN.fit <- with(subdata, marcher::estimate_shift(T=indice, X=x, Y=y,n.clust = 3))
##D # 3. convert output
##D MWN.segm <- prepare_shiftfit(subdata,MWN.fit,diag.var = c("x","y"))
##D # 4. use segclust2d functions
##D plot(MWN.segm)
##D plot(MWN.segm,stationarity = TRUE)
##D segmap(MWN.segm)
## End(Not run)



