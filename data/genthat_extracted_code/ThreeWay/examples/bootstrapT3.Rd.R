library(ThreeWay)


### Name: bootstrapT3
### Title: Bootstrap percentile intervals for Tucker3
### Aliases: bootstrapT3
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5],1,1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)],3,8)
# T3 solution
BusT3 <- T3funcrep(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
## Not run: 
##D # Bootstrap analysis on T3 solution using matching via optimal transformation
##D boot <- bootstrapT3(Bus, BusT3$A, BusT3$B, BusT3$C, BusT3$H, 7, 5, 37, 2, 2, 2, 
##D  1e-6, 0, 0, 1, laba, labb, labc)
##D # Bootstrap analysis on T3 solution using matching via orthogonal rotation 
##D # (when labels are not available)
##D boot <- bootstrapT3(Bus, BusT3$A, BusT3$B, BusT3$C, BusT3$H, 7, 5, 37, 2, 2, 2, 
##D  1e-6, 0, 0, 0)
## End(Not run)



