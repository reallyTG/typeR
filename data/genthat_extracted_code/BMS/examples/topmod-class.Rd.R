library(BMS)


### Name: topmod-class
### Title: Class "topmod"
### Aliases: topmod-class
### Keywords: classes

### ** Examples

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



