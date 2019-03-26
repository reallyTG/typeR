library(StAMPP)


### Name: stampp2genlight
### Title: Convert StAMPP genotype data to genlight object
### Aliases: stampp2genlight

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Convert the StAMPP formatted allele frequency data frame to a genlight object
potato.genlight <- stampp2genlight(potato.freq, TRUE)



