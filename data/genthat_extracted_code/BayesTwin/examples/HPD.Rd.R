library(BayesTwin)


### Name: HPD
### Title: Calculate highest posterior density interval
### Aliases: hpd HPD
### Keywords: utilities

### ** Examples

data(results)

#Obtain the 95% HPD for additive genetic variance 
HPD(results$samples_var_a)

#Obtain the 90% HPD for all item difficulty parameters
apply(results$samples_item_b, 1, function (x) HPD(x, 0.90))



