library(gquad)


### Name: slipped
### Title: Predicting slipped motif(s)
### Aliases: slipped

### ** Examples

 ## Predicting slipped motif(s) from raw DNA sequences
E1 <- c("TCTTACTGTGACTGTGGAAT", "taggtgctgggaggtagagacaggatatcct")
slipped(E1)

## Predicting slipped motif(s) from DNA sequences in fasta file
## Not run: slipped(x="Example.fasta", xformat = "fasta")

## Predicting slipped motif(s) from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: slipped(c("BH114913", "AY611035"), xformat = "GenBank")



