library(geomorph)


### Name: estimate.missing
### Title: Estimate locations of missing landmarks
### Aliases: estimate.missing
### Keywords: utilities

### ** Examples

data(plethodon)
plethland<-plethodon$land
  plethland[3,,2]<-plethland[8,,2]<-NA  #create missing landmarks
  plethland[3,,5]<-plethland[8,,5]<-plethland[9,,5]<-NA  
  plethland[3,,10]<-NA  
  
estimate.missing(plethland,method="TPS")
estimate.missing(plethland,method="Reg")



