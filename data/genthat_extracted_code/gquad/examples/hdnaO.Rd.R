library(gquad)


### Name: hdnaO
### Title: Predicting intramolecular triplexes (H-DNA) including overlaps
### Aliases: hdnaO

### ** Examples

## Predicting H-DNA (including overlaps) from raw DNA sequences
E1 <- c("TCTTCCCCCCTTTTTYYYYYGCTYYYYYTTTTTCCCCCCGAAT", "taggtgctgggaggtagagacaggatatcct")
hdnaO(E1)

## Predicting H-DNA (including overlaps) from DNA sequences in fasta file
## Not run: hdnaO(x="Example.fasta", xformat = "fasta")

## Predicting H-DNA (including overlaps) from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: hdnaO(c("BH114913", "AY611035"), xformat = "GenBank")



