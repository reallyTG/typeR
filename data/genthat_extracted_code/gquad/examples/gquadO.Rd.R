library(gquad)


### Name: gquadO
### Title: Predicting G quadruplexes including overlaps
### Aliases: gquadO

### ** Examples

## Predicting G quadruplexes (including overlaps) from raw nucleotide sequences
E1 <- c("TCTTGGGCATCTGGAGGCCGGAAT", "taggtgctgggaggtagagacaggatatcct")
gquadO(E1)

## Predicting G quadruplexes (including overlaps) from nucleotide sequences in fasta file
## Not run: gquadO(x="Example.fasta", xformat = "fasta")

## Predicting G quadruplexes (including overlaps) from nucleotide sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: gquadO(c("BH114913", "AY611035"), xformat = "GenBank")



