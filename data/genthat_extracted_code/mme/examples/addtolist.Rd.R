library(mme)


### Name: addtolist
### Title: Add items from a list
### Aliases: addtolist
### Keywords: models

### ** Examples

k=3  #number of categories for the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata2) # data
mod=2
datar=data.mme(simdata2,k,pp,mod)

##Add the time periods
l=addtolist(datar$X,datar$t,datar$d)



