library(BIOdry)


### Name: levexp
### Title: Vector releveling
### Aliases: levexp

### ** Examples

##Multilevel ecological data series of tree-ring widths:
data(Prings05,envir = environment())
## tree radii measured at 2003:
data(Pradii03,envir = environment())    

## Releveling the tree radii
refs <- levexp(Pradii03,Prings05)
refs



