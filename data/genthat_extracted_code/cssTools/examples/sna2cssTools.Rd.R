library(cssTools)


### Name: sna2cssTools
### Title: Convert a CSS in 'sna' Format to a CSS in 'cssTools' Format
### Aliases: sna2cssTools

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

# Here d is coded in cssTools package format
# Switching between sna and cssTools formats
e=cssTools2sna(d)
f=sna2cssTools(e)



