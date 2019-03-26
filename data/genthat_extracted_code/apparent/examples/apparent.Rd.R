library(apparent)


### Name: apparent
### Title: Accurate parentage analysis in the absence of guiding
###   information
### Aliases: apparent 'Parentage analysis'
### Keywords: Parentage analysis Pedigree inference R package Single
###   Nucleotide Polymorphism (SNP)

### ** Examples

# Load the input file
InputFile <- apparent_TestData
# Run the apparent
apparentOUT <- apparent(InputFile)
# Check the Triad analysis output
apparentOUT$Triad_all
apparentOUT$Triad_sig 



