library(shazam)


### Name: makeAverage1merSub
### Title: Make a 1-mer substitution model by averaging over a 5-mer
###   substitution model
### Aliases: makeAverage1merSub

### ** Examples

# Make a degenerate 5-mer model (4x1024) based on HKL_S1F (4x4)
degenerate5merSub <- makeDegenerate5merSub(sub1mer = HKL_S1F)

# Now make a 1-mer model by averaging over the degenerate 5-mer model
# Expected to get back HKL_S1F
makeAverage1merSub(sub5mer = degenerate5merSub)




