library(randomizationInference)


### Name: latinRand
### Title: Random Treatment Assignments for Isomorphic Latin Square Designs
### Aliases: latinRand
### Keywords: methods

### ** Examples

w = c("C","D","B","A","A","B","D","C","D","C","A","B","B","A","C","D")
row = rep(1:4,4)
col = c(rep(1,4),rep(2,4),rep(3,4),rep(4,4))
latinRand(w, nrand = 5, row, col)



