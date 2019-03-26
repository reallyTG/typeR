library(spa)


### Name: update.spa
### Title: Update procedure for transductive prediction with the SPA
### Aliases: update.spa
### Keywords: classes models methods

### ** Examples

## Use simulated example (two moon)
set.seed(100)
dat=spa.sim(type="moon") 

##Use spa to train with a supervised/transductive kernel smoother
gsemi<-spa(dat$y,graph=as.matrix(daisy(dat[,-1])))

##Use spa to update the object with new data
dat<-rbind(dat,spa.sim(100,0))
gsemi<-update(gsemi,ynew=dat$y,,as.matrix(daisy(dat[,-1])),trans.update=TRUE)




