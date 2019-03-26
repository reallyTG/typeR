library(checkmate)


### Name: checkBit
### Title: Check if an argument is a bit vector
### Aliases: checkBit check_bit assertBit assert_bit testBit test_bit
###   expect_bit

### ** Examples

library(bit)
x = as.bit(replace(logical(10), sample(10, 5), TRUE))
testBit(x, len = 10, min.0 = 1)



