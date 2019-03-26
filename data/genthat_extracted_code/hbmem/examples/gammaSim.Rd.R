library(hbmem)


### Name: gammaSim
### Title: Function gammaSim
### Aliases: gammaSim

### ** Examples

library(hbmem)
#Data from hiererchial model
sim=gammaSim() 
slotNames(sim) 
table(sim@resp,sim@cond,sim@Scond)

#Usefull to make data.frame for passing to model-fitting functions
dat=as.data.frame(cbind(sim@subj,sim@item,sim@cond,sim@Scond,sim@lag,sim@resp))
colnames(dat)=c("sub","item","cond","Scond","lag","resp")

table(dat$resp,dat$cond,dat$Scond)



