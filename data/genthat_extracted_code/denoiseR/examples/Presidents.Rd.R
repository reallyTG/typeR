library(denoiseR)


### Name: Presidents
### Title: Contingency table with US Presidents speeches.
### Aliases: Presidents
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Presidents)
##D isa.ca <- ISA(Presidents, delta = 0.1, transformation = "CA")
##D rownames(isa.ca$mu.hat) <- rownames(Presidents)
##D colnames(isa.ca$mu.hat) <- colnames(Presidents)
##D res.isa.ca <- CA(as.data.frame(isa.ca$mu.hat), graph = FALSE)
##D plot(res.isa.ca, title = "Regularized CA", cex = 0.8, selectRow = "contrib 40")
##D plot(res.isa.ca, title = "Regularized CA", cex = 0.6, invisible = "row" )
## End(Not run)



