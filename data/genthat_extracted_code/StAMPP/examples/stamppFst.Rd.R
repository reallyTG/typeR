library(StAMPP)


### Name: stamppFst
### Title: Fst Computation
### Aliases: stamppFst

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate pairwise Fst values between each population
potato.fst <- stamppFst(potato.freq, 100, 95, 1)



