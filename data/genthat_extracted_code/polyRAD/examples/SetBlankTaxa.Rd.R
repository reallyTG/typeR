library(polyRAD)


### Name: SetBlankTaxa
### Title: Functions to Assign Taxa to Specific Roles
### Aliases: SetBlankTaxa GetBlankTaxa SetDonorParent GetDonorParent
###   SetRecurrentParent GetRecurrentParent
### Keywords: methods utilities

### ** Examples

# assign parents in a mapping population
data(exampleRAD_mapping)
exampleRAD_mapping <- SetDonorParent(exampleRAD_mapping, "parent1")
exampleRAD_mapping <- SetRecurrentParent(exampleRAD_mapping, "parent2")
GetDonorParent(exampleRAD_mapping)
GetRecurrentParent(exampleRAD_mapping)

# assign blanks
exampleRAD_mapping <- SetBlankTaxa(exampleRAD_mapping, 
                                   c("progeny019", "progeny035"))
GetBlankTaxa(exampleRAD_mapping)



