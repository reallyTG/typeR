library(BVS)


### Name: enumerateBVS
### Title: Function to Enumerate all models for Bayesian Variant Selection
###   Methods
### Aliases: enumerateBVS
### Keywords: model enumeration

### ** Examples

## Load the data for Rare variant example
data(RareData)

## Enumerate model space for a subset of 5 variants and save output to BVS.out 
## for rare variant example.
RareBVS.out <- enumerateBVS(data=RareData[,1:6],rare=TRUE)



