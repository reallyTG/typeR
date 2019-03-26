library(ThreeWay)


### Name: T2
### Title: Interactive Tucker2 analysis
### Aliases: T2
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
## Not run: 
##D # interactive T2 analysis
##D BusT2 <- T2(Bus, laba, labb, labc)
##D # interactive T2 analysis (when labels are not available)
##D BusT2 <- T2(Bus)
## End(Not run)



