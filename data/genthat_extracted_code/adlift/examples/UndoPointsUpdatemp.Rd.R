library(adlift)


### Name: UndoPointsUpdatemp
### Title: UndoPointsUpdatemp
### Aliases: UndoPointsUpdatemp
### Keywords: arith

### ** Examples

#read in data with multiple values...

data(motorcycledata)
times<-motorcycledata$time
accel<-motorcycledata$accel
short<-adjustx(times,accel,"mean")
X<-short$sepx
coeff<-short$sepx
g<-short$g

coefflist<-list()
for (i in 1:length(g)){
coefflist[[i]]<-accel[g[[i]]]
}

I<-intervals(X,"reflect")
lengths<-lengthintervals(X,I,neighbours=2,closest=TRUE)

#work out neighbours of point to be removed (31)

out<-getnbrs(X,31,order(X),2,TRUE)
nbrs<-out$n

nbrs

newnbrs<-NULL
for (i in 1:length(nbrs)){
newnbrs<-c(newnbrs,rep(nbrs[i],times=length(g[[nbrs[i]]])))
}

#work out repeated neighbours using g...
newnbrs

p<-AdaptNeighmp(order(X),X,coefflist,coeff,nbrs,newnbrs,31,TRUE,2,"ave",g)

nbrs<-p$newinfo[[3]]
newnbrs<-NULL
for (i in 1:length(nbrs)){
newnbrs<-c(newnbrs,rep(nbrs[i],times=length(g[[nbrs[i]]])))
}
coefflist[[31]]<-p$results[[6]][31]

u<-PointsUpdatemp(X,coefflist,p$newinfo[[2]],newnbrs,p$newinfo[[3]],31,order(X),p$results[[4]],
lengths)

p2<-setdiff(order(X),31)
a<-which(order(X)==31)
l2<-lengths[setdiff(1:length(X), a)]
#
#remove the lifted coefficient
#
#now undo the update step...
#
undo<-UndoPointsUpdatemp(X,coeff,newnbrs,p$newinfo[[2]],p$newinfo[[3]],31,
a,length(X)-1,p2,p$results[[4]],l2,lengths[a])
#




