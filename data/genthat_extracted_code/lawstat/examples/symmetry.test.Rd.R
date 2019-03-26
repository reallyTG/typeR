library(lawstat)


### Name: symmetry.test
### Title: Test of Symmetry
### Aliases: symmetry.test
### Keywords: htest distribution

### ** Examples

data(zuni) #run ?zuni to see the data description
symmetry.test(zuni[,"Revenue"], boot = FALSE)

##	Symmetry test by Miao, Gel, and Gastwirth (2006)
##
## data:  zuni[, "Revenue"]
## Test statistic = 5.0321, p-value = 4.851e-07
## alternative hypothesis: the distribution is asymmetric.




