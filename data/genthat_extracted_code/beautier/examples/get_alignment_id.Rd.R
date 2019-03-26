library(beautier)


### Name: get_alignment_id
### Title: Conclude the ID from a FASTA filename.
### Aliases: get_alignment_id

### ** Examples

  # Path need not exist, use UNIX path as example
  created <- get_alignment_id("/home/homer/anthus_aco_sub.fas")
  expected <- "anthus_aco_sub"
  testit::assert(created == expected)



