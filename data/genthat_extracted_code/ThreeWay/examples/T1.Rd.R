library(ThreeWay)


### Name: T1
### Title: Interactive Tucker1 analysis
### Aliases: T1
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5],1,1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)],3,8)
## Not run: 
##D # interactive T1 analysis
##D BusT1 <- T1(Bus, laba, labb, labc)
##D # interactive T1 analysis (when labels are not available)
##D BusT1 <- T1(Bus)
## End(Not run)



