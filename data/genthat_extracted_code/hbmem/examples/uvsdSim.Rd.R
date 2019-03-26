library(hbmem)


### Name: uvsdSim
### Title: Function uvsdSim
### Aliases: uvsdSim

### ** Examples

library(hbmem)
#Data from hiererchial model
sim=uvsdSim() 
slotNames(sim) 
table(sim@resp,sim@Scond,sim@cond)

#Usefull to make data.frame for passing to model-fitting functions
dat=as.data.frame(cbind(sim@subj,sim@item,sim@cond,sim@Scond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","cond","Scond","lag","resp")

table(dat$resp,dat$Scond,dat$cond)



