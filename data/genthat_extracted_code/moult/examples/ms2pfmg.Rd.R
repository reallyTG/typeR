library(moult)


### Name: ms2pfmg
### Title: Convert moult scores to proportion of feather mass grown
### Aliases: ms2pfmg

### ** Examples

## relative primary feather mass of the 10 primary feathers 
## (as proportion of total feather mass) for Sanderlings
fm.sand <- c(0.0385, 0.0458, 0.0544, 0.0680, 0.0827, 0.1019,
             0.1199, 0.1417, 0.1604, 0.1867)   

ms2pfmg(3, 0.2)              # single feather
ms2pfmg(3, 1)
ms2pfmg("5555500000", fm.sand)




