library(jackknifeKME)


### Name: simdata
### Title: Generating survival data
### Aliases: simdata

### ** Examples

#For Cper = 30%.
data<-simdata(n = 100,lambda = 3.48)
data 

#For Cper = 50%.
data2<-simdata(n = 100,lambda = 2.04) 
data2

#For Cper = 80%.
data3<-simdata(n = 100,lambda = 0.87) 
data3



