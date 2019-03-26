library(gquad)


### Name: str
### Title: Predicting short tandem repeats
### Aliases: str

### ** Examples

 ## Predicting short tandem repeats from raw nucleotide sequences
E1 <- c("TCTACACACACACACACACACGAAT", "tagggugugugugugugugugugutcct")
str(E1)

## Predicting short tandem repeats from nucleotide sequences in fasta file
## Not run: str(x="Example.fasta", xformat = "fasta")

## Predicting short tandem repeats from nucleotide sequences,
## using GenBank accession numbers.
## Internet connectivity is needed for this to work.
## Not run: str(c("BH114913", "AY611035"), xformat = "GenBank")



