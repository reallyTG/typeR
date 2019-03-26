library(adlift)


### Name: AdaptPredmp
### Title: AdaptPredmp
### Aliases: AdaptPredmp
### Keywords: regression

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

AdaptPredmp(order(X),X,coefflist,coeff,nbrs,newnbrs,31,TRUE,2,"ave",g)




