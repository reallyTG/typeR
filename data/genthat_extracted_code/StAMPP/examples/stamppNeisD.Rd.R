library(StAMPP)


### Name: stamppNeisD
### Title: Genetic Distance Calculation
### Aliases: stamppNeisD

### ** Examples

# import genotype data and convert to allele frequecies 
data(potato.mini, package="StAMPP")
potato.freq <- stamppConvert(potato.mini, "r")

# Calculate genetic distance between individuals
potato.D.ind <- stamppNeisD(potato.freq, FALSE)

# Calculate genetic distance between populations
potato.D.pop <- stamppNeisD(potato.freq, TRUE)



