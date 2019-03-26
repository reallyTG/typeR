library(lestat)


### Name: compose
### Title: Building a new probability distribution from an old.
### Aliases: compose compose.default compose.discretedistribution
###   compose.uniformdistribution compose.betadistribution compose.normal
### Keywords: compose

### ** Examples

joint <- compose(uniformdistribution(), "binomialdistribution", 5)
joint2 <- compose(discretedistribution(1:6), "discretedistribution", 
     1:6, matrix(c(1:36), 6, 6))



