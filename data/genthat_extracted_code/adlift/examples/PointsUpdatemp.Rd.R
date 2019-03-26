library(adlift)


### Name: PointsUpdatemp
### Title: PointsUpdatemp
### Aliases: PointsUpdatemp
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
nbrs
newnbrs<-NULL
for (i in 1:length(nbrs)){
newnbrs<-c(newnbrs,rep(nbrs[i],times=length(g[[nbrs[i]]])))
}
newnbrs

coefflist[[31]]<-p$results[[6]][31]

u<-PointsUpdatemp(X,coefflist,p$newinfo[[2]],newnbrs,p$newinfo[[3]],31,
order(X),p$results[[4]],lengths)
#
#and here is the updated coefficient list...
u$coeff



