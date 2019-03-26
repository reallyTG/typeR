library(CIAAWconsensus)


### Name: at.weight
### Title: Atomic weight and isotopic abundances of a chemical element from
###   isotope ratios
### Aliases: at.weight

### ** Examples

## Atomic weight and isotopic abundances of iridium which correspond
## to the isotope ratio 191Ir/193Ir = 0.59471(13)
at.weight(0.59471, matrix(0.00013^2), "iridium", "193Ir")

## Atomic weight and isotopic abundances of silicon which correspond
## to isotope ratios 28Si/29Si = 1.074(69) and 30Si/29Si = 260(11)
## with a correlation of 0.80 between the two isotope ratios
ratios = c(1.074,260)
r.cov = matrix(c(0.069^2,0.80*0.069*11,0.80*0.069*11,11^2),ncol=2,byrow=TRUE)
at.weight(ratios, r.cov, "silicon", "29Si")



