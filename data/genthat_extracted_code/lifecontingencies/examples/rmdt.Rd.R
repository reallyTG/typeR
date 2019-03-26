library(lifecontingencies)


### Name: rmdt
### Title: Simulate from a multiple decrement table
### Aliases: rmdt

### ** Examples

mdtDf<-data.frame(x=c(0,1,2,3),death=c(100,50,30,10),lapse=c(150,20,2,0))
myMdt<-new("mdt",name="example Mdt",table=mdtDf)
ciao<-rmdt(n=5,object = myMdt,x = 0,t = 4,include.t0=FALSE,t0="alive")




