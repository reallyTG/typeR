library(mme)


### Name: data.mme
### Title: Function to generate matrices and the initial values
### Aliases: data.mme
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata2) #Data
mod=2

##Needed matrix and initial values
datar=data.mme(simdata2,k,pp,mod)



