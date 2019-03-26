library(NetworkToolbox)


### Name: smallworldness
### Title: Small-worldness Measure
### Aliases: smallworldness

### ** Examples

A<-TMFG(neoOpen)$A

swmHG <- smallworldness(A, method="HG")

swmRand <- smallworldness(A, method="rand")

swmTJHBL <- smallworldness(A, method="TJHBL")




