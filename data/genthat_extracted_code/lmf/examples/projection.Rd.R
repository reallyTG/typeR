library(lmf)


### Name: projection
### Title: The projection matrix
### Aliases: projection procomp promat

### ** Examples

#Data set from Engen et al. 2012
data(sparrowdata)
#The uniue age classes
unique.age <- unique(sparrowdata$age)
#Estimate the components of the projection matrix
projection.components <- procomp(a = sparrowdata, uage = unique.age)
#View components
projection.components
#Set up the projection matrix
promat(pc = projection.components, nage = length(unique.age))



