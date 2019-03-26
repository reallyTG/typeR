library(mme)


### Name: mmedata
### Title: Create objects of class mmedata
### Aliases: mmedata
### Keywords: data

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)
r=mmedata(simdata,k,pp)



