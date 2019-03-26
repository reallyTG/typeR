library(gquad)


### Name: hdna
### Title: Predicting intramolecular triplexes (H-DNA)
### Aliases: hdna

### ** Examples

## Predicting H-DNA from raw DNA sequences
E1 <- c("TCTTCCCCCCTTTTTYYYYYGCTYYYYYTTTTTCCCCCCGAAT", "taggtgctgggaggtagagacaggatatcct")
hdna(E1)

## Predicting H-DNA from DNA sequences in fasta file
## Not run: hdna(x="Example.fasta", xformat = "fasta")

## Predicting H-DNA from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: hdna(c("BH114913", "AY611035"), xformat = "GenBank")



