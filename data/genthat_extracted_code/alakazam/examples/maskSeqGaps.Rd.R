library(alakazam)


### Name: maskSeqGaps
### Title: Masks gap characters in DNA sequences
### Aliases: maskSeqGaps

### ** Examples

# Mask with Ns
maskSeqGaps(c("ATG-C", "CC..C"))
maskSeqGaps("--ATG-C-")
maskSeqGaps("--ATG-C-", outer_only=TRUE)

# Mask with dashes
maskSeqGaps(c("ATG-C", "CC..C"), mask_char="-")




