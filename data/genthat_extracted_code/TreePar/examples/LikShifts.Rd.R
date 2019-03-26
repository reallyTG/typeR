library(TreePar)


### Name: LikShifts
### Title: LikShifts: Calculates the likelihood of time-dependent birth and
###   death rates given a phylogenetic tree.
### Aliases: LikShifts

### ** Examples


timevec<-c(0,0.15,0.25)
lambdavec<-c(2.5,2,3)
muvec<-c(0.5,0.7,0.6)
x<-c(0.3,0.19,0.1)
x1<-c(x,max(x)*1.1)
x2<-c(x,max(x))
sampling<-0.4
grouptime<- rep(min(x)*0.95,length(x)+1)
group<- cbind(grouptime,grouptime*0+1)
group2 <- group
group2[1,2] <- 4
group2[2,2] <- 5
group2[3,2] <- 3
group3<-group
group3[2,2]<-10

### calculate likelihoods with root = 1

## Shifts in speciation / extinction rates (Stadler, PNAS 2011; Smrckova & Stadler, Manuscript 2014)
for (survival in c(0,1)) {
print(LikShiftsPP(x,timevec,lambdavec,muvec,sampling,survival=survival))
print(LikShifts(x,timevec,lambdavec,muvec,c(sampling,1,1),survival= survival))
print(LikShifts(x,timevec,lambdavec,muvec,c(sampling,1,1),survival= survival,groups=group))
print(LikShiftsSTT(par=c(lambdavec,muvec,timevec[-1]),x,x*0+1,sprob=c(0,0,0),
sampling=c(sampling,0,0),survival=survival,root=1))
print(" ")
}

## Shifts in speciation / extinction rates with group sampling
for (survival in c(0,1)) {
print(LikShifts(x,timevec,lambdavec,muvec,c(sampling,1,1),survival= survival,groups=group2))
print(LikShifts(x,timevec,lambdavec,muvec,c(sampling,1,1),survival= survival,groups=group3))
print(" ")
}

## Constant speciation and extinction rates 
# condition on age of tree x[1] and number of tips n
LikShiftsPP(x,timevec[1],lambdavec[1],muvec[1],sampling,n=1)
LikConstantn(lambdavec[1],muvec[1],sampling,x)
print(" ")
# condition on age of tree x[1]
for (survival in c(0,1)) {
print(LikConstant(lambdavec[1],muvec[1],sampling,x,root=1,survival=survival))
print(LikShiftsSTT(par=c(lambdavec[1],lambdavec[1],muvec[1],muvec[1],1),x,x*0+1,
sprob=c(0,0),sampling=c(sampling,1),survival=survival,root=1))
print(LikShiftsPP(x,c(0),lambdavec[1],muvec[1],sampling,root=1,survival=survival))
print(LikShifts(x,c(0),lambdavec[1],muvec[1],c(sampling),survival=survival))
print(LikShifts(x,c(0),lambdavec[1],muvec[1],c(sampling),survival= survival,groups=group))
print(LikShifts(x,c(0),c(lambdavec[1],lambdavec[1],lambdavec[1]),
c(muvec[1],muvec[1],muvec[1]),c(sampling,1,1),survival= survival))
## No test: 
 if (survival == 0 ) {
	print(LikDD(c(lambdavec[1],muvec[1], 200), 
	model=0 ,root=1, x=sort(x),sampling=sampling)[1])  }
if (survival == 0 ) {
	print(LikDD(c(lambdavec[1],muvec[1], 300), 
	model=-1 ,root=1, x=sort(x),sampling=sampling)[1])  }
## End(No test)
print(" ")
}

## Diversity-dependent speciation rates
# condition on age of tree x[1], survival = 0
N<-10
pars <- matrix(c(N,lambdavec[1],muvec[1],0,sampling),nrow=1)
## No test: 
print(LikDD(c(lambdavec[1],muvec[1],N),x=sort(x),model=-1,root=1,sampling=sampling)[1])
## If you have the R package expoTree, you can compare:
# library(expoTree)
# print(-runExpoTree(pars,sort(x2),rep(1,length(x2)),survival=0)+(length(x)-1)*log(2))
print(" ")
## End(No test)

### calculate likelihoods with root = 0

## Constant speciation and extinction rates 
# condition on age of tree x[1] and number of tips n
print(LikShiftsPP(x,timevec[1],lambdavec[1],muvec[1],sampling,root=0,n=1))
print(LikConstantn(lambdavec[1],muvec[1],sampling,x,root=0))
print(" ")
# condition on age of tree x[1]
for (survival in c(0,1)){
print(LikShiftsPP(x,c(0),lambdavec[1],muvec[1],sampling,root=0,survival=survival))
print(LikConstant(lambdavec[1],muvec[1],sampling,x,root=0,survival=survival))
## No test: 
if (survival == 0 ) {print(LikDD(c(lambdavec[1],muvec[1], 200), 
	model=0 ,root=0, x=sort(x),sampling=sampling)[1])  }
if (survival == 0 ) {print(LikDD(c(lambdavec[1],muvec[1], 300), 
	model=-1 ,root=0, x=sort(x),sampling=sampling)[1])  }
## End(No test)
print(" ")
}
## Diversity-dependent speciation rates
# condition on age of tree x[1], survival = 0
print(LikDD(c(lambdavec[1],muvec[1],N),x=sort(x),model=-1,root=0,sampling=sampling)[1])
## If you have the R package expoTree, you can compare:
#	print(-runExpoTree(pars,sort(x),rep(1,length(x)),survival=0)+(length(x)-1)*log(2))



