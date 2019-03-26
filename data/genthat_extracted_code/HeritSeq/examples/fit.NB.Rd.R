library(HeritSeq)


### Name: fit.NB
### Title: Fit negative binomial mixed models (NBMM) for one or more
###   features.
### Aliases: fit.NB

### ** Examples

## No test: 
## Compute vpc for each feature under NBMM. This will take a while on the
##  entire dataset. For the purpose of illustration, here we only fit on 
##  the first 2 features.
library(glmmADMB)
result.nb <- fit.NB(simData[1:2, ], strains)
## End(No test)



