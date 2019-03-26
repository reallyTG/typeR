library(alakazam)


### Name: translateDNA
### Title: Translate nucleotide sequences to amino acids
### Aliases: translateDNA

### ** Examples

# Translate a single sequence
translateDNA("ACTGACTCGA")

# Translate a vector of sequences
translateDNA(ExampleDb$JUNCTION[1:3])

# Remove the first and last codon from the translation
translateDNA(ExampleDb$JUNCTION[1:3], trim=TRUE)




