library(ThreeWay)


### Name: splithalfT3
### Title: Split-Half Analysis
### Aliases: splithalfT3
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5],1,1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)],3,8)
## Not run: 
##D # Split-half analysis on T3 solution
##D splitT3 <- splithalfT3(Bus, 7, 5, 37, 2, 2, 2, 0, 0, 0, 3, 3, 0, 5, 1e-6, 
##D  laba, labb, labc)
##D # Split-half analysis on T3 solution (when labels are not available)
##D splitT3 <- splithalfT3(Bus, 7, 5, 37, 2, 2, 2, 0, 0, 0, 3, 3, 0, 5, 1e-6)
## End(Not run)



