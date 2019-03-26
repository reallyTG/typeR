library(VeryLargeIntegers)


### Name: 24. Random generators
### Title: Random Generators of vli Objects
### Aliases: '24. Random generators' rvlidigits rvliunif rvliunif.default
###   rvliunif.numeric rvliunif.vli rvlibin rvlibin.default rvlibin.numeric
###   rvlibin.vli rvlinegbin rvlinegbin.default rvlinegbin.numeric
###   rvlinegbin.vli rvliprime rvliprime.default rvliprime.numeric
###   rvliprime.vli

### ** Examples

rvlidigits(2000)
rvliunif(3425, as.vli("2061341345304562604342"))
rvlibin(100, 0.6)
rvlinegbin(as.vli("1000000"), 0.5)
rvliprime(as.vli("100000"), iter = 10, test = "MR")



