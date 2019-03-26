library(GrpString)


### Name: TransMx
### Title: Transition matrices in one group of strings
### Aliases: TransMx
### Keywords: programming

### ** Examples

# simple strings
strs.vec <- c("ABCDdefABCDa", "def123DC", "123aABCD", "ACD13", "AC1ABC", "3123fe")
TransMx(strs.vec)

# simple strings, export an individual transition matrix for each string
strs.vec <- c("ABCDdefABCDa", "def123DC", "123aABCD", "ACD13", "AC1ABC", "3123fe")
TransMx(strs.vec, indiv = TRUE)



