library(bclust)


### Name: dptplot
### Title: dendrogram-profile-teeth plot
### Aliases: dptplot

### ** Examples

data(gaelle)

gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT, 4 for the rest

gaelle.lab<-c("ColWT","d172","d263","isa2",
"sex4","dpe2","mex1","sex3","pgm","sex1","WsWT","tpt","RLDWT","ke103")
gaelle.bclust<-bclust(gaelle,rep.id=gaelle.id,labels=gaelle.lab,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68))
dptplot(gaelle.bclust,scale=5,varimp=imp(gaelle.bclust)$var,
horizbar.plot=TRUE)
#replicated clustering


gaelle.bclust<-bclust(gaelle,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68))
dptplot(gaelle.bclust,scale=10,varimp=imp(gaelle.bclust)$var,
horizbar.plot=TRUE,plot.width=5,horizbar.size=0.2,ylab.mar=4)
#unreplicated clustering

wildtype<-rep(1,55) #initiate a vector
wildtype[c(1:3,48:51,40:43)]<-2 #associate 2 to wildtypes
dptplot(gaelle.bclust,scale=10,varimp=imp(gaelle.bclust)$var,
horizbar.plot=TRUE,plot.width=5,horizbar.size=0.2,vertbar=wildtype,
vertbar.col=c("white","violet"),ylab.mar=4)




