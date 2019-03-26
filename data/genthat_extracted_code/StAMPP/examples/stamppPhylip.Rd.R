library(StAMPP)


### Name: stamppPhylip
### Title: Export to Phylip Format
### Aliases: stamppPhylip

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate genetic distance between populations
potato.D.pop <- stamppNeisD(potato.freq, TRUE)

# Export the genetic distance matrix in Phylip format
stamppPhylip(potato.D.pop, file="potato_distance.txt")



