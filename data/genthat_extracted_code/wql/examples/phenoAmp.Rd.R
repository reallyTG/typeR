library(wql)


### Name: phenoAmp
### Title: Phenological amplitude
### Aliases: phenoAmp phenoAmp,ts-method phenoAmp,zoo-method
### Keywords: manip ts

### ** Examples


y <- sfbayChla[, 's27']
phenoAmp(y) # entire year
# i.e., Jan-Jun only, which yields results for more years
phenoAmp(y, c(1, 6)) 




