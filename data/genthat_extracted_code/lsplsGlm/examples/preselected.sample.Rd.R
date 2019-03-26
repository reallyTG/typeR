library(lsplsGlm)


### Name: preselected.sample
### Title: Selected randomized controlled random sample
### Aliases: preselected.sample

### ** Examples

#load data
data(BreastCancer)
index<-preselected.sample(BreastCancer$Y,10)
index
BreastCancer$Y[index]      



