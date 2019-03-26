library(StAMPP)


### Name: StAMPP-package
### Title: Statistical Analysis of Mixed Ploidy Populations
### Aliases: StAMPP-package StAMPP
### Keywords: package

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate genetic distance between populations
potato.D.pop <- stamppNeisD(potato.freq, TRUE)

# Calculate genetic distance between individuals
potato.D.ind <- stamppNeisD(potato.freq, FALSE)

# Calculate AMOVA
stamppAmova(potato.D.ind, potato.freq, 100)

# Export the genetic distance matrix in Phylip format
stamppPhylip(potato.D.pop, file="potato_distance.txt")

# Calculate pairwise Fst values between each population
potato.fst <- stamppFst(potato.freq, 100, 95, 1)

# Calculate genomic relationship values between each individual
potato.gmat <- stamppGmatrix(potato.freq)

# Convert allele frequency genotype data frame to a genlight object for use in other packages
potato.genlight <- stampp2genlight(potato.freq, TRUE)



