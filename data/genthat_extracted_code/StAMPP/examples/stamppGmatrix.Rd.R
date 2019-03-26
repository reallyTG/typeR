library(StAMPP)


### Name: stamppGmatrix
### Title: Genomic Relationship Calculation
### Aliases: stamppGmatrix

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate genomic relationship values between each individual
potato.fst <- stamppGmatrix(potato.freq)



