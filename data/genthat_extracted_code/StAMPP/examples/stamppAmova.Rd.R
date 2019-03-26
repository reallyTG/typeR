library(StAMPP)


### Name: stamppAmova
### Title: Analysis of Molecular Variance
### Aliases: stamppAmova

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate genetic distance between individuals
potato.D.ind <- stamppNeisD(potato.freq, FALSE)

# Calculate AMOVA
stamppAmova(potato.D.ind, potato.freq, 100)



