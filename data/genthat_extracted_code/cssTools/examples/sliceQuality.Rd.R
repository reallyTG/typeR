library(cssTools)


### Name: sliceQuality
### Title: Evaluate Several Characteristics of Slices from a CSS
### Aliases: sliceQuality

### ** Examples

# Consider the example in Siciliano et. al. (2012),
# a network with five actors A, B, C, D, E
sA=matrix(c(0,0,1,0,1,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0),5,5)
sB=matrix(c(0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0),5,5)
sC=matrix(c(0,1,1,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0),5,5)
sD=matrix(c(0,0,1,0,1,0,0,1,1,0,1,1,0,0,0,0,1,0,0,1,1,0,0,1,0),5,5)
sE=matrix(c(0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0),5,5)
d=array(dim=c(5,5,5))
d[,,1]=sA
d[,,2]=sB
d[,,3]=sC
d[,,4]=sD
d[,,5]=sE

# Compute the quality of CSS slices
sliceQuality(d)



