library(GrpString)


### Name: CommonPatt
### Title: Discovers common patterns in a group of strings - simplified
###   version
### Aliases: CommonPatt
### Keywords: programming

### ** Examples

# Simple strings, non-default cutoff
strs.vec <- c("ABCDdefABCDa", "def123DC", "123aABCD", "ACD13", "AC1ABC", "3123fe")
CommonPatt(strs.vec, low = 30)



