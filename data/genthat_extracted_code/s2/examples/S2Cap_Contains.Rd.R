library(s2)


### Name: S2Cap_Contains
### Title: Test of Containment in S2Cap
### Aliases: S2Cap_Contains

### ** Examples

cap <- list(axis = c(0,1,0), height = 0.1)
S2Cap_Contains(cap, matrix(c(0,1,0),ncol=3))
S2Cap_Contains(cap, matrix(c(1,0,0),ncol=3))



