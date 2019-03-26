library(VeryLargeIntegers)


### Name: 05. Efficent division by a power of 2
### Title: Efficient Division by a Power of 2
### Aliases: '05. Efficent division by a power of 2' divp2 divp2.default
###   divp2.numeric divp2.vli

### ** Examples

# Dividing a random 500 digits integer by 2^10 = 1024
x <- rvlidigits(500)
x
divp2(x, 10)



