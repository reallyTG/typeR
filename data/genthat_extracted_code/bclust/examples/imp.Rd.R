library(bclust)


### Name: imp
### Title: calculates variable and variable-cluster importances
### Aliases: imp

### ** Examples

data(gaelle)

gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT, 4 for the rest

gaelle.bclust<-bclust(gaelle,rep.id=gaelle.id,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68),
var.select=TRUE)

gaelle.imp<-imp(gaelle.bclust)

#plot the variable importances 
par(mfrow=c(1,1)) #retreive graphic defaults 

mycolor<-gaelle.imp$var
mycolor<-c()
mycolor[gaelle.imp$var>0]<-"black"
mycolor[gaelle.imp$var<=0]<-"white"

viplot(var=gaelle.imp$var,xlab=gaelle.imp$labels,col=mycolor)
#plot important variables with balck

viplot(var=gaelle.imp$var,xlab=gaelle.imp$labels,
sort=TRUE,col=heat.colors(length(gaelle.imp$var)),
xlab.mar=10,ylab.mar=4)
mtext(1, text = "Metabolite", line = 7,cex=1.5)# add x axis label
mtext(2, text = "Log Bayes Factor", line = 3,cex=1.2)# add y axis labels
#sort importnaces and use heat colors add some labels to the x and y axes



