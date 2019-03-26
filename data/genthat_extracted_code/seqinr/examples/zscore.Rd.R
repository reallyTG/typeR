library(seqinr)


### Name: dinucleotides
### Title: Statistical over- and under- representation of dinucleotides in
###   a sequence
### Aliases: rho zscore

### ** Examples

## Not run: 
##D sequence <- sample(x = s2c("acgt"), size = 6000, replace = TRUE)
##D rho(sequence)
##D zscore(sequence, modele = "base")
##D zscore(sequence, modele = "base", exact = TRUE)
##D zscore(sequence, modele = "codon")
##D zscore(sequence, simulations = 1000, modele = "syncodon")
## End(Not run)



