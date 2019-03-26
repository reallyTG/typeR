library(GrpString)


### Name: TransInfo
### Title: Transitions in one group of strings
### Aliases: TransInfo
### Keywords: programming

### ** Examples

# default values
strs.vec <- c("ABCDdefABCDa", "def123DC", "123aABCD", "ACD13", "AC1ABC", "3123fe")
TransInfo(strs.vec)

# non-default values
str1.vec <- c("ABCABEF", "CDCDAB")
TransInfo(str1.vec, type1 = "AB", type2 = "CD")



