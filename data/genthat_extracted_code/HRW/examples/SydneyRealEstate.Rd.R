library(HRW)


### Name: SydneyRealEstate
### Title: Sydney real estate
### Aliases: SydneyRealEstate

### ** Examples

library(HRW) ; data(SydneyRealEstate)
## Not run: 
##D for (colNum in setdiff((2:39),c(5,8)))
##D {
##D    plot(jitter(SydneyRealEstate[,colNum]),SydneyRealEstate$logSalePrice,pch = ".",
##D         xlab = names(SydneyRealEstate)[colNum],ylab = "log(sale price)",col = "blue")
##D    readline("Hit Enter to continue.\n")
##D }
## End(Not run)



