library(BMS)


### Name: topmod
### Title: Topmodel Object
### Aliases: topmod is.topmod
### Keywords: models

### ** Examples

#standard use
  tm= topmod(2,4,TRUE,0) #should keep a  maximum two models
  tm$addmodel(-2.3,c(1,1,1,1),1:4,5:8) #update with some model
  tm$addmodel(-2.2,c(0,1,1,1),1:3,5:7) #add another model
  tm$addmodel(-2.2,c(0,1,1,1),1:3,5:7) #add it again -> adjust ncount
  tm$addmodel(-2.5,c(1,0,0,1),1:2,5:6) #add another model
  
  #read out
  tm$lik()
  tm$ncount()
  tm$bool_binary()
  tm$betas()
  
  is.topmod(tm)
  
  #extract a topmod oobject only containing the second best model
  tm2=tm[2]
  
  
  
  #advanced: should return the same result as
  #initialize
  tm2= topmod(2,4,TRUE,0, liks = c(-2.2,-2.3), ncounts = c(2,1), 
          modelbinaries = cbind(c(0,1,1,1),c(1,1,1,1)), betas = cbind(0:3,1:4), 
          betas2 = cbind(c(0,5:7),5:8)) 

  #update 
  tm$addmodel(-2.5,c(1,0,0,1),1:2,5:6) #add another model
  
  #read out
  tm$lik()
  tm$ncount()
  tm$bool_binary()
  tm$betas()




