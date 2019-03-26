library(clinDR)


if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.fitEmax_new.pdf"))) file.rename(file.path(pvar,"output.fitEmax_new.pdf"), 
																																				 file.path(pvar,"output.fitEmax_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.fitEmax_new.pdf")))



set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-c(78,81,81,81,77,80)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop.parm<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop.parm)  

y<-rnorm(sum(n),meanlev,sdy)

testout<-fitEmax(y,dose,modType=4)

### basic test
plot(testout)
#plot(testout, xat=c(-100, 0, 5, 100, 350)) #fail planned
#plot(testout, xat=c(0, 5, 100, 350, 400)) #fail planned
plot(testout, xat=c(0, 100, 350))

plot(testout, log=TRUE)
#plot(testout, log=TRUE, xat=c(-100, 0, 5, 100, 350)) #fail planned
#plot(testout, log=TRUE, xat=c(0, 5, 100, 350, 400)) #fail planned
plot(testout, log=TRUE, xat=c(0, 5, 100, 350))

plot(testout,plotDif=TRUE)
plot(testout,plotDif=TRUE, log=TRUE)

### with symbol
symbol<-1+1*(dose==100)
plot(testout,symbol=symbol)
plot(testout,symbol=symbol, log=TRUE)

plot(testout,symbol=symbol,
	 symbolLabel='TESTGROUP',
	 symbolShape=c(8,10),symbolColor=c('blue','red'))
plot(testout,symbol=symbol, log=TRUE,
     symbolLabel='TESTGROUP',
     symbolShape=c(8,10),symbolColor=c('blue','red'))

plot(testout,symbol=symbol,
	 symbolLabel='TESTGROUP',
	 symbolShape=c(8,10),symbolColor=c('blue','red'),plotDif=TRUE)
plot(testout,symbol=symbol, log=TRUE,
     symbolLabel='TESTGROUP',
     symbolShape=c(8,10),symbolColor=c('blue','red'),plotDif=TRUE)

### residual plot

plot(testout,plotResid=TRUE)
plot(testout,plotResid=TRUE, log=TRUE)
#####################################################################
##### tests with multiple protocols and 3-parm emax
##### one protocol much larger than other
set.seed(12357)
doselev<-c(0,5,25,50,100,350)
n<-80

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop.parm<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop.parm)  

y<-rnorm(n*length(doselev),meanlev,sdy)

prot<-rep('a',length(y))
prot[1:(5*length(doselev))]<-'b'

symbol=1*(dose<300)+2*(dose>=300)
symbolLabel='TESTNAME'
symbolColor=c('red','blue','green')
symbolShape=c(8,10)

testout2<-fitEmax(y,dose,modType=3,prot=prot)


plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
	 symbolShape=symbolShape,symbolColor=symbolColor)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
     symbolShape=symbolShape,symbolColor=symbolColor, log=TRUE)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
	 symbolShape=symbolShape,symbolColor=symbolColor,plotDif=TRUE)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
     symbolShape=symbolShape,symbolColor=symbolColor,plotDif=TRUE, log=TRUE)

testout3<-fitEmax(y,dose,modType=3)
symbmod<-symbol
symbmod[prot==1 & dose==350]<-1
plot(testout3,bwidth=10,symbol=symbmod,symbolLabel=symbolLabel,
	 symbolShape=symbolShape,symbolColor=symbolColor)
plot(testout3,bwidth=10,symbol=symbmod,symbolLabel=symbolLabel,
     symbolShape=symbolShape,symbolColor=symbolColor, log=TRUE)


###############################################################
#### 3 parm, int=2, starting value given
#### no intercept
####
set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-10*c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-0
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
pop.parm<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop.parm)  


y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep('d',n1),rep('ee',n2))

ysub<-y[dose!=0]
dsub<-dose[dose!=0]
protsub<-prots[dose!=0]


testout<-fitEmax(ysub,dsub,iparm=pop.parm,modType=3,prot=protsub,pboAdj=TRUE)

plot(testout)
plot(testout, log=TRUE)

testout4<-fitEmax(ysub,dsub,iparm=c(pop.parm[1],1,pop.parm[2],0),
				  modType=4,prot=protsub,pboAdj=TRUE)

plot(testout4)
plot(testout4, log=TRUE)

#########################################################################
##### binary
set.seed(12357)

dvec1<-c(0,.1,.3,.6,1)
dvec2<-c(0,.1,.2,.4,.6,1)
nd1<-length(dvec1)
nd2<-length(dvec2)
n1<-rep(10000,nd1)
n2<-rep(10000,nd2)

parms<-c(log(0.25),1,1.4,-0.5,-0.85)

mlev1<-plogis(emaxfun(dvec1,parms[1:4]))
mlev2<-plogis(emaxfun(dvec2,parms[c(1:3,5)]))

y1<-rbinom(nd1,n1,mlev1)
y2<-rbinom(nd2,n2,mlev2)

### fitEmax inputs
y<-c(rep(1,nd1),rep(0,nd1),rep(1,nd2),rep(0,nd2))
counts<-c(y1,n1-y1,y2,n2-y2)
prots<-c(rep('eg',2*nd1),rep('fg',2*nd2))
dvec<-c(dvec1,dvec1,dvec2,dvec2)


testout<-fitEmax(y,dvec,modType=4,parms[1:4],
          prot=prots,
          count=counts,binary=TRUE,diagnostics=FALSE)

plot(testout)
plot(testout, log=TRUE)
plot(testout, log=TRUE, xat=c(0.1, 0.2, 0.4, 0.6, 1.0))


plot(testout,plotDif=TRUE)
plot(testout,plotDif=TRUE, log=TRUE)
plot(testout,plotDif=TRUE, log=TRUE, xat=c(0.1, 0.2, 0.4, 0.6, 1.0))


testout2<-fitEmax(y[prots=='fg'],dvec[prots=='fg'],modType=4,parms[1:4],
          count=counts[prots=='fg'],binary=TRUE,diagnostics=FALSE)

plot(testout2)
plot(testout2, log=TRUE)

plot(testout2,plotDif=TRUE)
plot(testout2,plotDif=TRUE, log=TRUE)


##################
### covariates
## 3 covariates, 2 protocols
set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-c(78,81,81,81,77,80)
n1<-sum(n)
n2<-sum(n[1:4])

doselev<-c(doselev,doselev[1:4])
n<-c(n,n[1:4])

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-8.0
x1<-matrix(rnorm(3*n1),ncol=3)
x1<-scale(x1,center=TRUE,scale=FALSE)
x2<-matrix(rnorm(3*n2),ncol=3)
x2<-scale(x2,center=TRUE,scale=FALSE)
x<-rbind(x1,x2)
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
bparm<-c(2,-1,0.5)
meanlev<-emaxfun(dose,pop) + x%*%bparm 

y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))


testout2<-fitEmax(y,dose,modType=4,prot=prots,xbase=x,diagnostics = FALSE)

plot(testout2)
plot(testout2, log=TRUE)

plot(testout2,plotDif=TRUE)
plot(testout2,plotDif=TRUE, log=TRUE)

### binary, covariates
### check with larger n for better asymptotics
### 4-parm model, 2 covariates, 1 protocol
### starting values specified
###

set.seed(12357)

doselev<-c(0,5,25,50,100,350)
n<-5*c(78,81,81,81,77,80)
ntot<-sum(n)

### population parameters for simulation
e0<- -1.5 
ed50<-67.481113 
emax<-4.0
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
meanlev<-emaxfun(dose,pop)  
iparm<-c(log(ed50),1,emax,e0)

x<-matrix(rnorm(2*ntot),ncol=2)
x<-scale(x,center=TRUE,scale=FALSE)
bparm<-c(2,-1)
meanlev<-plogis(meanlev + x%*%bparm)

y<-rbinom(ntot,1,meanlev)


testout4b<-fitEmax(y,dose,modType=4,iparm=iparm,xparm=bparm,xbase=x,
											binary=TRUE,diagnostics=FALSE)

plot(testout4b)

plot(testout4b,plotDif=TRUE)

dev.off()