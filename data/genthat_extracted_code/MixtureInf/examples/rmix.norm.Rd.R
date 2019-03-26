library(MixtureInf)


### Name: rmix.norm
### Title: generate a random sample from a mixture of normals
### Aliases: rmix.norm
### Keywords: datagen distribution

### ** Examples

#generate a random sample from a 2 component normal mixture,
#plot the histogram of the data.
x <- rmix.norm(200,c(0.3,0.7),c(-1,2),c(1,2))
hist(x)



