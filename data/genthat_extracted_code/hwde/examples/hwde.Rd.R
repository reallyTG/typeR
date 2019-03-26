library(hwde)


### Name: hwde
### Title: Fit relevant models, and test for various types of departure
###   from Hardy-Weinberg equilibrium.  Allows only 2 alleles per locus.
###   The number of loci is arbitrary.
### Aliases: hwde
### Keywords: models

### ** Examples

data(IndianIrish)
hwde(data=IndianIrish)
data(mendelABC)
hwde(data=mendelABC, loci=c("seedshape", "cotylcolor", "coatcolor"))



