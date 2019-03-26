library(gquad)


### Name: gquad
### Title: Predicting G quadruplexes
### Aliases: gquad

### ** Examples

## Predicting G quadruplexes from raw nucleotide sequences
E1 <- c("TCTTGGGCATCTGGAGGCCGGAAT", "taggtgctgggaggtagagacaggatatcct")
gquad(E1)

## Predicting G quadruplexes from nucleotide sequences in fasta file
## Not run: gquad(x="Example.fasta", xformat = "fasta")

## Predicting G quadruplexes from nucleotide sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: gquad(c("BH114913", "AY611035"), xformat = "GenBank")



