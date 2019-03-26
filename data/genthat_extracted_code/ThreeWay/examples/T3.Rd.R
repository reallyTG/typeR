library(ThreeWay)


### Name: T3
### Title: Interactive Tucker3 analysis
### Aliases: T3
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5],1,1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)],3,8)
## Not run: 
##D # interactive T3 analysis
##D BusT3 <- T3(Bus, laba, labb, labc)
##D # interactive T3 analysis (when labels are not available)
##D BusT3 <- T3(Bus)
## End(Not run)



