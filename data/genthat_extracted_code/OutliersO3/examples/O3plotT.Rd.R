library(OutliersO3)


### Name: O3plotT
### Title: Draws an Overview of Outliers (O3) plot for one method and
###   parallel coordinate plots
### Aliases: O3plotT
### Keywords: ~kwd1 ~kwd2

### ** Examples

a0 <- O3prep(stackloss, method="PCS", tols=0.05, boxplotLimits=3)
a1 <- O3plotT(a0)
a1$nOut
a1$gO3

b0 <- O3prep(stackloss, method="BAC", k1=2, tols=0.01, boxplotLimits=6)
b1 <- O3plotT(b0)
b1$nOut
b1$gpcp
b1$gO3

## Not run: 
##D a2 <- O3prep(stackloss, method="PCS", tols=c(0.1, 0.05, 0.01), boxplotLimits=c(3, 6, 10))
##D a3 <- O3plotT(a2)
##D a3$nOut
##D a3$gpcp
##D a3$gO3
##D a3$outsTable
## End(Not run)




