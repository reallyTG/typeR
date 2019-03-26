library(gquad)


### Name: zdna
### Title: Predicting Z-DNA motif(s)
### Aliases: zdna

### ** Examples

 ## Predicting Z-DNA motif(s) from raw DNA sequences
E1 <- c("TCTTGCGCGCGCGCGCGCGCGCGCGCAAT", "taggtgctgggaggtagagacaggatatcct")
zdna(E1)

## Predicting Z-DNA motif(s) from DNA sequences in fasta file
## Not run: zdna(x="Example.fasta", xformat = "fasta")

## Predicting Z-DNA motif(s) from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: zdna(c("BH114913", "AY611035"), xformat = "GenBank")



