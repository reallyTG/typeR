library(polysat)


### Name: genotypeProbs
### Title: Calculate Probabilities of Unambiguous Genotypes
### Aliases: genotypeProbs
### Keywords: symbolmath distribution

### ** Examples

# get a data set and define ploidies
data(testgenotypes)
Ploidies(testgenotypes) <- c(8,8,8,4,8,8,rep(4,14))
# get allele frequencies
tfreq <- simpleFreq(testgenotypes)

# see results of genotypeProbs under different circumstances
Genotype(testgenotypes, "FCR7", "RhCBA15")
genotypeProbs(testgenotypes, "FCR7", "RhCBA15", tfreq)
Genotype(testgenotypes, "FCR10", "RhCBA15")
genotypeProbs(testgenotypes, "FCR10", "RhCBA15", tfreq)
Genotype(testgenotypes, "FCR1", "RhCBA15")
genotypeProbs(testgenotypes, "FCR1", "RhCBA15", tfreq)
Genotype(testgenotypes, "FCR2", "RhCBA23")
genotypeProbs(testgenotypes, "FCR2", "RhCBA23", tfreq)
Genotype(testgenotypes, "FCR3", "RhCBA23")
genotypeProbs(testgenotypes, "FCR3", "RhCBA23", tfreq)




