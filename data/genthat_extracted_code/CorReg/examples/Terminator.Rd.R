library(CorReg)


### Name: Terminator
### Title: Destructing values to have missing ones
### Aliases: Terminator

### ** Examples

   ## Not run: 
##D   rm(list=ls())#clean the workspace
##D   
##D    data<-mtcars
##D    require(CorReg)
##D   datamiss=Terminator(target = data,wrath=0.05)#5% of missing values
##D   showdata(datamiss)#plot positions of the missing values
##D   datamiss=Terminator(target = data,diag=1)#diag of missing values
##D   showdata(datamiss)#plot positions of the missing values (no full individuals, no full variable)
##D     
## End(Not run)



