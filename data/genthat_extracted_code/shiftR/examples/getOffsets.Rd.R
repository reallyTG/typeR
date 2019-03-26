library(shiftR)


### Name: getOffsets
### Title: Generate Random or Uniformly Spaced Permutation Offsets
### Aliases: getOffsetsAll getOffsetsRandom getOffsetsUniform
###   getNOffsetsMax

### ** Examples

### Number of features, permutations, and margin
n = 100
npermute = 20
margin = 0.1

### Maximum number of permutations 
# Should be 81 (from 10 to 90)
getNOffsetsMax(n, margin)

### Random offsets
getOffsetsRandom(n, npermute, margin)

### Uniformly spaced offsets
getOffsetsUniform(n, npermute, margin)

### All possible offsets
getOffsetsAll(n, margin)



