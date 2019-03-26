library(ExceedanceTools)


### Name: create.pgrid2
### Title: Create grid of locations.
### Aliases: create.pgrid2

### ** Examples

seq1 = seq(0, 1, len = 101)
pgrida <- create.pgrid2(seq1, seq1, midpoint = FALSE)
seq2 = seq(.005, .995, len = 100)
pgridb <- create.pgrid2(seq2, seq2, midpoint = TRUE)
# pgrids produced match
range(pgrida$pgrid - pgridb$pgrid)



