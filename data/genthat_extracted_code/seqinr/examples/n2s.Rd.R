library(seqinr)


### Name: n2s
### Title: function to convert the numeric encoding of a DNA sequence into
###   a vector of characters
### Aliases: n2s
### Keywords: utilities

### ** Examples

##example of the default behaviour:
nseq <- sample(x = 0:3, size = 100, replace = TRUE)
n2s(nseq) 
# Show what happens with out-of-range and NA values:
nseq[1] <- NA
nseq[2] <- 777
n2s(nseq)[1:10]
# How to get an RNA instead:
n2s(nseq, levels = c("a", "c", "g", "u"))



