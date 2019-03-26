library(HeritSeq)


### Name: fit.CP
### Title: Fit compound Poisson mixed effect models (CPMM) for one or more
###   features.
### Aliases: fit.CP

### ** Examples

## Fit CPMM for the first two features and test the presence of 
## heritability. 
result.cp <- fit.CP(simData[1:2, ], strains, test = TRUE)
## Extract parameters
para.cp <- result.cp[[1]]
## Extract p-values
pval.cp <- result.cp[[2]]




