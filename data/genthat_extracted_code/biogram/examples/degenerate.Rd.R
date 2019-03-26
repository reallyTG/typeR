library(biogram)


### Name: degenerate
### Title: Degenerate protein sequence
### Aliases: degenerate
### Keywords: manip

### ** Examples

sample_seq <- c(1, 3, 1, 3, 4, 4, 3, 1, 2)
table(sample_seq)

# aggregate sequence to purins and pyrimidines
deg_seq <- degenerate(sample_seq, list(w = c(1, 4), s = c(2, 3)))
table(deg_seq)



