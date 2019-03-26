library(gquad)


### Name: tfo
### Title: Predicting triplex forming oligonucleotide(s)
### Aliases: tfo

### ** Examples

 ## Predicting triplex forming oligonucleotide(s) from raw DNA sequences
E1 <- c("TCTTGGGAGGGAGAGAGAGAAAGAGATCTGGAGGCCGGAAT", "taggtgctgggaggtagagacaggatatcct")
tfo(E1)

## Predicting triplex forming oligonucleotide(s) from DNA sequences in fasta file
## Not run: tfo(x="Example.fasta", xformat = "fasta")

## Predicting triplex forming oligonucleotide(s) from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: tfo(c("BH114913", "AY611035"), xformat = "GenBank")



