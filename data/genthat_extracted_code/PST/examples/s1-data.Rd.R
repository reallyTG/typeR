library(PST)


### Name: s1
### Title: Example sequence data set
### Aliases: s1
### Keywords: datasets

### ** Examples

## Loading the data
data(s1)

## Creating a state sequence object
s1.seq <- seqdef(s1)

## Building and plotting a PST
S1 <- pstree(s1.seq, L = 3)
plot(S1)



