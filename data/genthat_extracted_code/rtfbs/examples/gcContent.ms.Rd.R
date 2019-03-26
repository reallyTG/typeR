library(rtfbs)


### Name: gcContent.ms
### Title: Get GC content of each sequence in an MS object
### Aliases: gcContent.ms

### ** Examples

require("rtfbs")
seqs <- ms(seqs=c("AAAA", "ACACACAC", "CGCCG", "ACGTACGTACGT", "CGGGGGGGGGG"),
           paste("fake", 1:5, sep=""))
gcContent.ms(seqs)



