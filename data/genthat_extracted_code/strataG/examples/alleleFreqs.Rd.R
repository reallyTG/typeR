library(strataG)


### Name: alleleFreqs
### Title: Allele Frequencies
### Aliases: alleleFreqs

### ** Examples

data(msats.g)

f <- alleleFreqs(msats.g)
f$D11t # Frequencies and proportions for Locus D11t

f.pop <- alleleFreqs(msats.g, TRUE)
f.pop$EV94[, "freq", "Coastal"] # Frequencies for EV94 in the Coastal population




