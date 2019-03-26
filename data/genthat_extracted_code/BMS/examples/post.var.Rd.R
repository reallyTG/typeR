library(BMS)


### Name: post.var
### Title: Posterior Variance and Deviance
### Aliases: post.var post.pr2 deviance.bma deviance.zlm
### Keywords: utilities

### ** Examples

 data(datafls)
  
 mm=bms(datafls[,1:10])
 deviance(mm)/nrow(datafls) # is equivalent to
 post.var(mm)
 
 post.pr2(mm) # is equivalent to
 1 - post.var(mm) / ( var(datafls[,1])*(1-1/nrow(datafls)) )
 



