library(sld)


### Name: lmom.sample
### Title: Calculate sample L-Moments
### Aliases: lmom.sample
### Keywords: estimation

### ** Examples

generated.data <- rsl(300,c(0,1,.4))
lmom.sample(data=generated.data,max.mom=3)

data(PCB1)
lmom.sample(PCB1,max.mom=3)



