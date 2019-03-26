library(HeritSeq)


### Name: getBootCI
### Title: Compute variance partition coefficition (VPC) confidence
###   intervals (CI) for one or more features.
### Aliases: getBootCI

### ** Examples

## No test: 
## Compute CI based on 100 bootstrap samples for the first feature 
##  under NBMM. It takes a few minutes.
NBboot <- getBootCI(simData, strains, 1, 100)
## Extract CI
NBboot.ci <- NBboot[[1]]
## Extract vpcs
NBboot.vpc <- NBboot[[2]]

## Compute CI based on 100 bootstrap samples for the first feature
##  under vst. 
VSTboot <- getBootCI(simData, strains, 1, 100, method = "VST")
## End(No test)




