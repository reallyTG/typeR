library(primerTree)


### Name: seq_lengths
### Title: Get a summary of sequence lengths from a primerTree object
### Aliases: seq_lengths

### ** Examples


# Show the counts for each length
seq_lengths(mammals_16S)

# Plot the distribution of lengths
seqLengths <- seq_lengths(mammals_16S)
barplot(seqLengths, 
 main = "Frequency of sequence lengths for 16S mammal primers", 
 xlab="Amplicon length (in bp)", 
 ylab=("Frequency"))



