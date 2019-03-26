library(GA)


### Name: binary2gray
### Title: Gray encoding for binary strings
### Aliases: binary2gray gray2binary

### ** Examples

# Consider a five-bit encoding of values 15 and 16  using the standard 
# binary coding
decimal2binary(15, 5)
decimal2binary(16, 5)
# Moving from 15 to 16 (or viceversa) all five bits need to be changed,
# but using Gray encoding the two binary strings differ by one bit.
binary2gray(decimal2binary(15, 5))
binary2gray(decimal2binary(16, 5))



