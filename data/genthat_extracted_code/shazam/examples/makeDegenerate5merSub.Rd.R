library(shazam)


### Name: makeDegenerate5merSub
### Title: Make a degenerate 5-mer substitution model based on a 1-mer
###   substitution model
### Aliases: makeDegenerate5merSub

### ** Examples

# Make a degenerate 5-mer model (4x1024) based on HKL_S1F (4x4)
# Note: not to be confused with HKL_S5F@substitution, which is non-degenerate
degenerate5merSub <- makeDegenerate5merSub(sub1mer = HKL_S1F)

# Look at a few 5-mers
degenerate5merSub[, c("AAAAT", "AACAT", "AAGAT", "AATAT")]




