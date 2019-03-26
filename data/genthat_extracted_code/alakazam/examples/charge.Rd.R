library(alakazam)


### Name: charge
### Title: Calculates the net charge of amino acid sequences.
### Aliases: charge

### ** Examples

seq <- c("CARDRSTPWRRGIASTTVRTSW", "XXTQMYVRT") 
# Unnormalized charge
charge(seq)
# Normalized charge
charge(seq, normalize=TRUE)

# Use the Murray et al, 2006 scores from the seqinr package
library(seqinr)
data(pK)
x <- setNames(pK[["Murray"]], rownames(pK))
# Calculate charge
charge(seq, pK=x)




