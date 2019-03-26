library(hbmem)


### Name: dpsdSim
### Title: Function dpsdSim
### Aliases: dpsdSim
### Keywords: models

### ** Examples

library(hbmem)
#Data from hiererchial model
sim=dpsdSim()
slotNames(sim)
#Scond indicates studied/new
#cond indicates which condition (e.g., deep/shallow)

table(sim@resp,sim@Scond,sim@cond)

#Usefull to make data.frame for passing to functions
dat=as.data.frame(cbind(sim@subj,sim@item,sim@Scond,sim@cond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","Scond","cond","lag","resp")

table(dat$resp,dat$Scond,dat$cond)



