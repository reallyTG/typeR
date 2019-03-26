library(gquad)


### Name: aphased
### Title: Predicting A-phased DNA repeat(s)
### Aliases: aphased

### ** Examples

 ## Predicting A-phased DNA repeat(s) from raw DNA sequences
E1 <- "TCTTGTTTTAAAACGTTTTAAAACGTTTTAAAACGTTTTAAAACGAAT"
aphased(E1)

## Predicting A-phased DNA repeat(s) from DNA sequences in fasta file
## Not run: aphased(x="Example.fasta", xformat = "fasta")

## Predicting A-phased DNA repeat(s) from DNA sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: aphased(c("BH114913", "AY611035"), xformat = "GenBank")



