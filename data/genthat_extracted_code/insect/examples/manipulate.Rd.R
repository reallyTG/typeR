library(insect)


### Name: manipulate
### Title: Further bit-level manipulation of DNA and amino acid sequences.
### Aliases: manipulate duplicated.DNAbin unique.DNAbin subset.DNAbin
###   duplicated.AAbin unique.AAbin subset.AAbin

### ** Examples

  data(whales)
  duplicates <- duplicated.DNAbin(whales, point = TRUE)
  attr(duplicates, "pointers")
  ## returned indices show that the last sequence is
  ## identical to the second one.
  ## subset the reference sequence database to only include unques
  whales <- subset.DNAbin(whales, subset = !duplicates)
  ## this gives the same result as
  unique.DNAbin(whales)



