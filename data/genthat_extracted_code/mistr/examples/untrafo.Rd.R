library(mistr)


### Name: untrafo
### Title: Untransformation of a Distribution Object
### Aliases: untrafo untrafo.trans_standist untrafo.trans_mixdist
###   untrafo.trans_compdist

### ** Examples

B  <- binomdist(10, 0.3)
B2 <- -3*log(B)
B2

untrafo(B2)



