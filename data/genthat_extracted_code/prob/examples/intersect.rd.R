library(prob)


### Name: intersect
### Title: Intersection of Subsets
### Aliases: intersect intersect.default intersect.data.frame intersect.ps
### Keywords: misc

### ** Examples

S <- cards()
A <- subset(S, suit == "Heart")
B <- subset(S, rank == "A" )
intersect(A, B)



