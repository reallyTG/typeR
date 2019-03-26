library(lambda.tools)


### Name: samplerange
### Title: Sample sub-sequences from a sequence
### Aliases: samplerange

### ** Examples

# Extract seven sub-sequences, each with length 3
samplerange(1:20, 7, 3)

# This time use replacement
samplerange(1:20, 7, 3, replace=TRUE)

# Extract five sub-matrices with dimensions 2 by 4
samplerange(matrix(1:32, ncol=4), 5, 2)



