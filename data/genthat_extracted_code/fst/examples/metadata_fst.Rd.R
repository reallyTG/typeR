library(fst)


### Name: metadata_fst
### Title: Read metadata from a fst file
### Aliases: metadata_fst fst.metadata

### ** Examples

# Sample dataset
x <- data.frame(
  First = 1:10,
  Second = sample(c(TRUE, FALSE, NA), 10, replace = TRUE),
  Last = sample(LETTERS, 10))

# Write to fst file
write_fst(x, "dataset.fst")

# Display meta information
metadata_fst("dataset.fst")



