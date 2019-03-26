library(bootspecdens)


### Name: specdens
### Title: Bootstrap for testing equality of spectral densities
### Aliases: specdens
### Keywords: ts nonparametric

### ** Examples

data(Nile)
data(WWWusage)
data<- matrix(c(Nile[1:20],WWWusage[1:20]), nrow=2, byrow=TRUE) #creates the data matrix with 
										    #the first 20 values of the 
										    #time series Nile and WWWusage
specdens(data, 0.2, 100, 0.05)



