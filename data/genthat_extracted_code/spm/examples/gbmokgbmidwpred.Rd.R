library(spm)


### Name: gbmokgbmidwpred
### Title: Generate spatial predictions using the average of the hybrid
###   method of generalized boosted regression modeling and ordinary
###   kriging and the hybrid method of generalized boosted regression
###   modeling and inverse distance weighting (gbmokgbmidw)
### Aliases: gbmokgbmidwpred

### ** Examples

## Not run: 
##D data(petrel)
##D data(petrel.grid)
##D gbmokgbmidwpred1 <- gbmokgbmidwpred(petrel[, c(1,2)], petrel[, c(1,2, 6:9)],
##D petrel[, 3], petrel.grid[, c(1,2)], petrel.grid, family = "gaussian",
##D n.cores=6, nmaxidw = 12, nmaxok = 12, vgm.args = ("Sph"))
##D names(gbmokgbmidwpred1)
## End(Not run)




