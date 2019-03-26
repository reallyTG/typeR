library(OutliersO3)


### Name: O3prep
### Title: Identify outliers for different combinations of variables
### Aliases: O3prep
### Keywords: ~kwd1 ~kwd2

### ** Examples

a0 <- O3prep(stackloss, method="PCS", tols=0.05, boxplotLimits=3)

b0 <- O3prep(stackloss, method=c("BAC", "adjOut"), k1=2, tols=0.01, boxplotLimits=6)

## Not run: 
##D a1 <- O3prep(stackloss, method="PCS", tols=c(0.1, 0.05, 0.01), boxplotLimits=c(3, 6, 10))
##D 
##D b1 <- O3prep(stackloss, method=c("HDo", "BAC", "DDC"), tolHDo=0.025, tolBAC=0.01, tolDDC=0.05)
## End(Not run)




