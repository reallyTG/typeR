library(tigger)


### Name: getMutatedPositions
### Title: Find the location of mutations in a sequence
### Aliases: getMutatedPositions

### ** Examples

# Create strings to act as a sample sequences and a reference sequence
seqs <- c("----GATA", "GAGAGAGA", "TANA")
ref <- "GATAGATA"

# Find the differences between the two
getMutatedPositions(seqs, ref)




