library(prob)


### Name: union
### Title: Union of Subsets
### Aliases: union union.default union.data.frame union.ps
### Keywords: misc

### ** Examples

S <- cards()
A <- subset(S, suit == "Heart")
B <- subset(S, rank == "A" )
union(A, B)
   


