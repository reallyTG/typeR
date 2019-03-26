library(alakazam)


### Name: padSeqEnds
### Title: Pads ragged ends of aligned DNA sequences
### Aliases: padSeqEnds

### ** Examples

# Default behavior uniformly pads ragged ends
seq <- c("CCCCTGGG", "ACCCTG", "CCCC")
padSeqEnds(seq)

# Pad to fixed length
padSeqEnds(seq, len=15)

# Add padding to the beginning of the sequences instead of the ends
padSeqEnds(seq, start=TRUE)
padSeqEnds(seq, len=15, start=TRUE)




