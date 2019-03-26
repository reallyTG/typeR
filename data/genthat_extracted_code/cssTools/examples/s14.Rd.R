library(cssTools)


### Name: s14
### Title: Calculate s14 Similarity Index
### Aliases: s14

### ** Examples

# Consider two matrices representing networks, d1 and d2
d1=matrix(c(0,0,1,0,1,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0),5,5)
d2=matrix(c(0,1,0,0,0,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0),5,5)

# The similarity index between d1 and d2
s14(d1,d2)



