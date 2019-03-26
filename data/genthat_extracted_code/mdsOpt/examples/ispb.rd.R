library(mdsOpt)


### Name: ispb
### Title: Calculation of I-stress per box indices for multidimensional
###   scaling procedure for interval-valued data
### Aliases: ispb
### Keywords: multidimensional scaling stress per box normalization methods
###   interval-valued data

### ** Examples

library(mdsOpt)
library(clusterSim)
library(smds)
data(data_symbolic_interval_polish_voivodships)
x1<-data_symbolic_interval_polish_voivodships[,,1]
y1<-data_symbolic_interval_polish_voivodships[,,2]
norm_type="n2" 
normalized<-interval_normalization(x=x1,y=y1,dataType="separate_tables",type=norm_type)
x<-normalized$simple[,,1]
y<-normalized$simple[,,2]
my.idiss<-idistBox(X=(x+y)/2,R=(y-x)/2)
#Apply the hyperbox model via the MM algorithm
cmat<-(my.idiss[2, , ] + my.idiss[1, , ])/2
iniX<-cmdscale(as.dist(cmat), k = 2)
n=dim(my.idiss)[2]
iniR<-matrix(rep(1,n * 2), nrow = n, ncol = 2)
res.mm_box<-IMDS(IDM=my.idiss, p=2,model="box",opt.method="MM", ini=list(iniX,iniR))
plot(res.mm_box)
title(main="box_MM")
#windows()
spb<-ispb(res.mm_box$EIDM,my.idiss)
w<-sort(spb,decreasing=TRUE)
print(spb)
names(w)<-order(spb,decreasing = TRUE)
plot(w, xlab="Object", ylab="spb in percents")
text(w,pos=1,names(w))



