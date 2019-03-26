library(HydeNet)


### Name: factorFormula
### Title: Convert Factor Levels in Formula to Numeric Values
### Aliases: factorFormula

### ** Examples

## Not run: 
##D Net <- HydeNetwork(~ wells +
##D                     pe | wells +
##D                     d.dimer | pregnant*pe +
##D                     angio | pe +
##D                     treat | d.dimer*angio +
##D                     death | pe*treat,
##D                   data = PE)
##D factorFormula(form = payoff ~ (death == 'No') + (pe == 'Yes'),
##D               network = Net)
## End(Not run)




