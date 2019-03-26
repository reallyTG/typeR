library(Familias)


### Name: NorwegianFrequencies
### Title: A list of markers with allele names and frequencies.
### Aliases: NorwegianFrequencies

### ** Examples

require(Familias)
data(NorwegianFrequencies)

#Displaying the Norwegian frequencies of the 
NorwegianFrequencies$TPOX

#Generating a FamiliasLocus with these frequencies
FamiliasLocus(NorwegianFrequencies$TPOX)

#Including a non-zero male mutation rate
FamiliasLocus(NorwegianFrequencies$TPOX, maleMutationRate = 0.005)

#Listing the names of available markers
names(NorwegianFrequencies)



