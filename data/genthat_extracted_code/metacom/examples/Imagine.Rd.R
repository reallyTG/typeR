library(metacom)


### Name: Imagine
### Title: Plotting of site-by-species interaction matrices
### Aliases: Imagine
### Keywords: ordination plotting

### ** Examples


#define an interaction matrix
data(TestMatrices)
pres3c=TestMatrices[[6]]

#plot interaction matrix
Imagine(pres3c, col=c('white','blue'), order=TRUE, fill=FALSE)




