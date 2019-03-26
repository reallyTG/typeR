library(prob)


### Name: setdiff
### Title: Set Difference of Subsets
### Aliases: setdiff setdiff.default setdiff.data.frame setdiff.ps
### Keywords: misc

### ** Examples

S <- cards()
A <- subset(S, suit == "Heart")
B <- subset(S, rank == "A" )
setdiff(B, A)



