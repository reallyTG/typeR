library(dlmap)


### Name: dlcross
### Title: Constructor, summary and plotting functions for dlcross format
### Aliases: dlcross plot.dlcross summary.dlcross

### ** Examples

## Not run: 
##D # load dataset
##D data(BSdat)
##D data(BSphe)
##D 
##D # convert data to dlmap format
##D dl.in1 <- dlcross(format="rqtl", genobj=BSdat, idname="ID", fixpos=1)
##D 
##D # convert data with separate phenotypic trait file
##D dl.in2 <- dlcross(format="rqtl", genobj=BSdat, pheobj=BSphe, idname="ID", step=5)
##D 
##D plot(dl.in2)
##D summary(dl.in2)
## End(Not run)



