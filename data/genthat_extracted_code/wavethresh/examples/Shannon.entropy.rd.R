library(wavethresh)


### Name: Shannon.entropy
### Title: Compute Shannon entropy
### Aliases: Shannon.entropy
### Keywords: manip

### ** Examples

#
# Generate some test data
#
#
# A sparse set
#
Shannon.entropy(c(1,0,0,0))
#0
#
# A evenly spread set
#
Shannon.entropy( rep( 1/ sqrt(4), 4 ))
#1.386294



