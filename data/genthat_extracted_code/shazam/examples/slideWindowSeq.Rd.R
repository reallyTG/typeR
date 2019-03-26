library(shazam)


### Name: slideWindowSeq
### Title: Sliding window approach towards filtering a single sequence
### Aliases: slideWindowSeq

### ** Examples

# Use an entry in the example data for input and germline sequence
data(ExampleDb, package="alakazam")
in_seq <- ExampleDb[100, "SEQUENCE_IMGT"]
germ_seq <-  ExampleDb[100, "GERMLINE_IMGT_D_MASK"]

# Determine if in_seq has 6 or more mutations in 10 consecutive nucleotides
slideWindowSeq(inputSeq=in_seq, germlineSeq=germ_seq, mutThresh=6, windowSize=10)
                                



