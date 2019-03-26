library(insect)


### Name: virtualPCR
### Title: Virtual PCR.
### Aliases: virtualPCR

### ** Examples

  ## trim whale sequences using a new set of inner primers
  inner_for <- "CGGTTGGGGTGACCTCGGAGTA"
  inner_rev <- "GCTGTTATCCCTAGGGTAA"
  whales_short <- virtualPCR(whales, up = inner_for, down = inner_rev,
                             trimprimers = TRUE)



