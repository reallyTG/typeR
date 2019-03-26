library(clinDR)


if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.fitEmaxB_new.pdf"))) file.rename(file.path(pvar,"output.fitEmaxB_new.pdf"), 
																																				 file.path(pvar,"output.fitEmaxB_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.fitEmaxB_new.pdf")))


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


prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(y,dose,prior=prior,modType=4,
								 mcmc=mcmc)

### basic test
plot(testout)
#plot(testout, xat=c(-100, 0, 5, 100, 350)) ## fail planned
#plot(testout, xat=c(0, 5, 100, 350, 400))  ## fail planned
plot(testout, xat=c(0, 100, 350))

plot(testout, log=TRUE)
#plot(testout, log=TRUE, xat=c(-100, 0, 5, 100, 350)) ## fail planned
#plot(testout, log=TRUE, xat=c(0, 5, 100, 350, 400))  ## fail planned
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

prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout2<-fitEmaxB(y,dose,prior=prior,modType=3,prot=prot,mcmc=mcmc)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
	 symbolShape=symbolShape,symbolColor=symbolColor)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
     symbolShape=symbolShape,symbolColor=symbolColor, log=TRUE)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
	 symbolShape=symbolShape,symbolColor=symbolColor,plotDif=TRUE)

plot(testout2,bwidth=10,symbol=symbol,symbolLabel=symbolLabel,
     symbolShape=symbolShape,symbolColor=symbolColor,plotDif=TRUE, log=TRUE)

testout3<-fitEmaxB(y,dose,prior=prior,modType=3,mcmc=mcmc)

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

prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(ysub,dsub,prior=prior,modType=3,prot=protsub,pboAdj=TRUE,mcmc=mcmc)

plot(testout)
plot(testout, log=TRUE)

testout4<-fitEmaxB(ysub,dsub,prior=prior,
				  modType=4,prot=protsub,pboAdj=TRUE,mcmc=mcmc)

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

prior<-prior.control(0,4,0,4,.5,edDF=5,binary=TRUE)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)


testout<-fitEmaxB(y,dvec,modType=4,
									prot=prots,
									count=counts,binary=TRUE,
									prior=prior,mcmc=mcmc,	
									diagnostics=FALSE)


plot(testout)
plot(testout, log=TRUE)
plot(testout, log=TRUE, xat=c(0.1, 0.2, 0.4, 0.6, 1.0))


plot(testout,plotDif=TRUE)
plot(testout,plotDif=TRUE, log=TRUE)
plot(testout,plotDif=TRUE, log=TRUE, xat=c(0.1, 0.2, 0.4, 0.6, 1.0))


testout2<-fitEmaxB(y[prots=='fg'],dvec[prots=='fg'],prior=prior,modType=4,
          count=counts[prots=='fg'],binary=TRUE,diagnostics=FALSE,
          mcmc=mcmc)

plot(testout2)
plot(testout2, log=TRUE)

plot(testout2,plotDif=TRUE)
plot(testout2,plotDif=TRUE, log=TRUE)


#################################################################################
#### include covariates
#################################################################################

## 1 covariate, 2 protocols
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
x1<-rnorm(n1)
x1<-x1-mean(x1)
x2<-rnorm(n2)
x2<-x2-mean(x2)
x<-matrix(c(x1,x2),ncol=1)
pop<-c(log(ed50),emax,e0)    
dose<-rep(doselev,n)
bparm<-1
meanlev<-emaxfun(dose,pop) + x%*%bparm 

y<-rnorm(n1+n2,meanlev,sdy)
prots<-c(rep(1,n1),rep(2,n2))

basemu<-0
basevar<-matrix((10*sdy)^2,nrow=1,ncol=1)
prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5,basemu=basemu,basevar=basevar)
mcmc<-mcmc.control(chains=3,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout<-fitEmaxB(y,dose,prior=prior,modType=4,prot=prots,xbase=x,
									mcmc=mcmc,diagnostics=TRUE)

plot(testout)

plot(testout,int=2)

plot(testout,int=1,plotDif=TRUE)

####################################
##### binary

set.seed(20572)

doselev<-c(0,5,25,50,100,350)
n<-4*c(78,81,81,81,77,80)
ntot<-sum(n)

### population parameters for simulation
e0<- -1.5 
ed50<-67.481113 
emax<-4.0
pop<-c(log(ed50),emax,e0)    
dose<-c(rep(doselev,n/2),rep(doselev,n/2))
prot<-sort(rep(1:2,ntot/2))
meanlev<-emaxfun(dose,pop)+0.5*(prot==2)  

x1<-matrix(rnorm(ntot),ncol=2)
x1<-scale(x1,center=TRUE,scale=FALSE)
x2<-matrix(rnorm(ntot),ncol=2)
x2<-scale(x2,center=TRUE,scale=FALSE)
x<-rbind(x1,x2)
bparm<-c(1.,-0.5)
meanlev<-plogis(meanlev + x%*%bparm)

y<-rbinom(ntot,1,meanlev)

basemu<-numeric(2)
basevar<-diag(2); basevar[2,1]<-.25; basevar[1,2]<-.25
basevar<-basevar*(4)^2  ## off-diagonal elements

prior<-prior.control(0,30,0,30,50,edDF=5,basemu=basemu,basevar=basevar,binary=TRUE)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

testout5b<-fitEmaxB(y,dose,prot=prot,prior=prior,modType=3,xbase=x,
										mcmc=mcmc,diagnostics=TRUE,binary=TRUE)

plot(testout5b,ngrid=50)

plot(testout5b,plotDif=TRUE,int=1,ngrid=100)

plot(testout5b,int=2,ngrid=50)

dev.off()


