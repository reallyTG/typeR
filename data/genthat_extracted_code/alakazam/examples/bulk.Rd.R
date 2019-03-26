library(alakazam)


### Name: bulk
### Title: Calculates the average bulkiness of amino acid sequences
### Aliases: bulk

### ** Examples

# Default bulkiness scale
seq <- c("CARDRSTPWRRGIASTTVRTSW", "XXTQMYVRT")
bulk(seq)

# Use the Grantham, 1974 side chain volumn scores from the seqinr package
library(seqinr)
data(aaindex)
x <- aaindex[["GRAR740103"]]$I
# Rename the score vector to use single-letter codes
names(x) <- translateStrings(names(x), ABBREV_AA)
# Calculate average volume
bulk(seq, bulkiness=x)




