library(clinDR)


if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.plotB_new.pdf"))) file.rename(file.path(pvar,"output.plotB_new.pdf"), 
																																				 file.path(pvar,"output.plotB_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.plotB_new.pdf")))



set.seed(12357)
data(examples14)
dat<-examples14[[6]]
attach(dat)

fit<-fitEmax(y,dose,modType=3,count=nsize,msSat=sd^2)

prior<-prior.control(epmu=1.78,epsd=1,emaxmu=-2.82,emaxsd=1,
										 p50=0.04,sigmalow=0.01,1)

fitb<-fitEmaxB(y,dose,prior,modType=4,count=nsize,msSat=sd^2,
							 mcmc=mcmc.control(iter=20000))

parms<-coef(fitb)
sigsim<-sigma(fitb)


##### basic plot
outB<-plotB(y,dose,parms[,1:4],(sigsim)^2,count=nsize,
      ylab="Y")

plot(outB)
plot(outB, xat=c(0, 25, 100)/100)

plot(outB, log=TRUE)
plot(outB, log=TRUE, xat=c(0, 5, 25, 100)/100)


##### resid plot
plot(outB,plotResid=TRUE,predict=FALSE)
plot(outB,plotResid=TRUE,predict=FALSE, log=TRUE)

##### test symbol plotting
symbol<-rep(2,length(dose))
symbol[1:floor(length(dose)/2)]<-1
outB<-plotB(y,dose,parms[,1:4],(sigsim)^2,count=nsize,symbol=symbol,
      ylab="Cholesterol")

plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
	 symbolLabel='TESTNAME')
plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
     symbolLabel='TESTNAME', log=TRUE)


#### use medians and no prediction
plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
	 symbolLabel='TESTNAME',plotMed=TRUE,predict=FALSE)

plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
     symbolLabel='TESTNAME',plotMed=TRUE,predict=FALSE, log=TRUE)

### residual plot
plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
	 symbolLabel='TESTNAME',plotResid=TRUE)

plot(outB,symbolShape=8:9,symbolColor=c('red','blue'),
     symbolLabel='TESTNAME',plotResid=TRUE, log=TRUE)

##### test as responder variable (Note: with small sample sizes
##### create patient level data   the predictive intervals and
#####                             points are discrete with big
#####                             jumps
ymeans<-predict(fitb,dose)$pred
ymeans<-rep(ymeans,nsize)
yvec<-rnorm(length(ymeans),ymeans,sd)
dvec<-rep(dose,nsize)
outBB<-plotB(yvec,dvec,parms[,1:4],(sigsim)^2,
      ylab="Change in LDL", log=TRUE)
plot(outBB,log=TRUE)
outBB<-plotB(yvec,dvec,parms[,1:4],(sigsim)^2,
      ylab="Change in LDL",binary='BinRes',BinResLev=-0.5,BinResDir='<')
plot(outBB,log=TRUE)
plot(outBB)
plot(outBB, log=TRUE)


##### test active comparator
set.seed(12357)
nac<-10
msd<-median(sigsim)
yac<-rnorm(nac,mean(y),msd)
ac<-rnorm(nrow(parms),mean(yac),msd/sqrt(nac))

outac<-plotB(y,dose,parms[,1:4],(sigsim)^2,count=nsize,
      ylab="Change in LDL vs Active Comparator",activeControl=TRUE,yac=yac,ac=ac,
	  dac=10,labac='Active',plotDif=TRUE)

plot(outac,labac='Active')
plot(outac,labac='Active', log=TRUE)

symbol<-rep(2,length(dose))
symbol[1:floor(length(dose)/2)]<-1
outac<-plotB(y,dose,parms[,1:4],(sigsim)^2,count=nsize,symbol=symbol,
		symbolShape=9:10,symbolColor=c('red','blue'),symbolLabel='TESTNAME',
      ylab="LDL with Active Comparator",activeControl=TRUE,yac=yac,ac=ac,
	  dac=10,labac='Prednisone',shapeac=9,colac='red')


hold<-plotB(y,dose,parms[,1:4],(sigsim)^2,count=nsize,symbol=symbol,
             symbolShape=9:10,symbolColor=c('red','blue'),symbolLabel='TESTNAME',
             ylab="LDL with Active Comparator",activeControl=TRUE,yac=yac,ac=ac,
             dac=10,labac='Prednisone',shapeac=9,colac='red')
plot(hold)

#### with responder outcome
symvec<-rep(symbol,nsize)
outac<-plotB(yvec,dvec,parms[,1:4],(sigsim)^2,
      ylab="Change in LDL vs Active Comparator",
	  activeControl=TRUE,yac=yac,ac=ac,dac=2,
	  binary='BinRes',BinResLev=0,BinResDir = '<')

outac<-plotB(yvec,dvec,parms[,1:4],(sigsim)^2,symbol=symvec,
		symbolShape=9:10,symbolColor=c('red','blue'),symbolLabel='TESTNAME',
      ylab="Change in LDL vs Active Comparator",
	  activeControl=TRUE,yac=yac,ac=ac,dac=2,
	  binary='BinRes',BinResLev=0,shapeac=9,colac='red')

outac<-plotB(yvec,dvec,parms[,1:4],(sigsim)^2,
             ylab="Change in EDD vs Active Comparator",
             activeControl=TRUE,yac=yac,ac=ac,dac=2,
             binary='BinRes',BinResLev=0)

plot(outac,symbolShape=9:10,symbolColor=c('red','blue'),
     xat=c(0, 50, 100)/100)


dev.off()
detach(dat)
