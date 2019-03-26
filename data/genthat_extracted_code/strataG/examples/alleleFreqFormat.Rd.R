library(strataG)


### Name: alleleFreqFormat
### Title: Compiles and Formats Allele Frequencies
### Aliases: alleleFreqFormat

### ** Examples

data(msats.g)

x <- cbind(
 id = sample(indNames(msats.g), 10, rep = TRUE),
 locus = sample(locNames(msats.g), 10, rep = TRUE)
)
alleleFreqFormat(x, msats.g)




