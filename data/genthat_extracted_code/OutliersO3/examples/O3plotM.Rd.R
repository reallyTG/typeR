library(OutliersO3)


### Name: O3plotM
### Title: Draws an Overview of Outliers (O3) plot for more than one method
###   and parallel coordinate plots
### Aliases: O3plotM
### Keywords: ~kwd1 ~kwd2

### ** Examples

c1 <- O3prep(stackloss, k1=2, method=c("HDo", "BAC"), tolHDo=0.025, tolBAC=0.01)
c2 <- O3plotM(c1)
c2$nOut
c2$gpcp
c2$gO3

## Not run: 
##D b1 <- O3prep(stackloss, method=c("HDo", "BAC", "DDC"), tolHDo=0.025, tolBAC=0.01, tolDDC=0.05)
##D b2 <- O3plotM(b1)
##D b2$nOut
##D b2$gpcp
##D b2$gO3
##D b2$outsTable
## End(Not run)

# It is advisable with large datasets to check the number of outliers identified (nOut)
# before drawing graphics.  Occasionally methods find very many outliers.
## Not run: 
##D  
##D data(diamonds, package="ggplot2")
##D data <- diamonds[1:5000, c(1, 5, 6, 8:10)]
##D pPa <- O3prep(data, method=c("PCS", "adjOut"), tolPCS=0.01, toladj=0.01, boxplotLimits=10)
##D pPx <- O3plotM(pPa)
##D pPx$nOut
## End(Not run)



