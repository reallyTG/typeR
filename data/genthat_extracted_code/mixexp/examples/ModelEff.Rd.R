library(mixexp)


### Name: ModelEff
### Title: This function creates mixture effect plots
### Aliases: ModelEff
### Keywords: hplot

### ** Examples


#Example p. 63-65 Cornell (control of Mites)
# Four Component Mixture
mite<-SCD(4)
yavg<-c(1.8,25.4,28.6,38.5,4.9,3.1,28.7,3.4,37.4,10.7,22.0,2.6,2.4,
        11.1,0.8)
mite<-cbind(mite,yavg)
miteSC<-MixModel(mite,"yavg",mixcomps=c("x1","x2","x3","x4"),model=4)
ModelEff(nfac=4,mod=4,nproc=0,dir=2,ufunc=miteSC,lc=c(0,0,0,0),uc=c(1,1,1,1))


# Cornell's (2002) Yarn elongation
x1<-c(1,1,.5,.5,.5,0,0,0,0,0,0,0,.5,.5,.5)
x2<-c(0,0,.5,.5,.5,1,1,.5,.5,.5,0,0,0,0,0)
x3<-c(0,0,0,0,0,0,0,.5,.5,.5,1,1,.5,.5,.5)
y<-c(11,12.4,15,14.8,16.1,8.8,10,10,9.7,11.8,16.8,16,17.7,16.4,16.6)
elong<-data.frame(x1,x2,x3,y)
testQ2<-MixModel(elong,"y",mixcomps=c("x1","x2","x3"),model=2)
ModelEff(nfac=3,mod=2,nproc=0,dir=2,ufunc=testQ2,lc=c(0,0,0),uc=c(1,1,1))

#### Kowalski Cornell and Vining Simplified model on data from Gallant et. al. (2008)
data(Burn)
testBNM<-MixModel(Burn,"y",mixcomps=c("Course","Fine","Binder"),model=6,procvars=c("z"))
ModelEff(nfac=3,mod=6,nproc=1,dir=1,ufunc=testBNM,dimensions = list(NULL), pvslice=c(1),
lc=c(.403,.166,.130),uc=c(.704,.412,.210))
ModelEff(nfac=3,mod=6,nproc=1,dir=1,ufunc=testBNM,dimensions = list(NULL), pvslice=c(-1),
lc=c(.403,.166,.130),uc=c(.704,.412,.210))






