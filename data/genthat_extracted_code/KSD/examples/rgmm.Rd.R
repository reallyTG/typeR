library(KSD)


### Name: rgmm
### Title: Generates dataset from Gaussian Mixture Model
### Aliases: rgmm

### ** Examples

#Generate 100 samples from default gaussian mixture model
model <- gmm()
X <- rgmm(model)

#Generate 300 samples from 3-d gaussian mixture model
model <- gmm(d=3)
X <- rgmm(model,n=300)



