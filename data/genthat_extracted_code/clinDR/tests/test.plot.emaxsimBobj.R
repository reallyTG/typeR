library(clinDR)

if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.emaxsimBobj_new.pdf"))) file.rename(file.path(pvar,"output.emaxsimBobj_new.pdf"), 
																																				 file.path(pvar,"output.emaxsimBobj_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.emaxsimBobj_new.pdf")))


set.seed(12357)
nsim<-50
idmax<-5
doselev<-c(0,5,25,50,100)
n<-c(78,81,81,81,77)

### population parameters for simulation
e0<-2.465375 
ed50<-67.481113 
emax<-15.127726
sdy<-7.967897
pop.parm<-c(log(ed50),emax,e0)    
meanlev<-emaxfun(doselev,pop.parm)  

###FixedMean is specialized constructor function for emaxsim
gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop.parm)  


prior<-prior.control(0,30,0,30,50,0.1,30,edDF=5)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)


D1 <- emaxsimB(nsim,gen.parm,prior=prior,mcmc=mcmc,check=FALSE)
e49<-D1[49]

#####################################################################
####
plot(e49)
plot(e49, xat=c(0, 5, 25, 100))


#### not implemented
#plot(e49, log=TRUE)
#plot(e49, log=TRUE, xat=c(0, 5, 25, 100))

### standard test with clev
plot(e49,clev=0.70)  
#plot(e49,clev=0.70, log=TRUE)

plot(e49,xlab='New Dose',ylab='Y',ylim=c(-5,15),plotPop='3',clev=0.9)
#plot(e49,xlab='New Dose',ylab='Y',ylim=c(-5,15),plotPop='3',clev=0.9, log=TRUE)
### pbo diff
plot(e49,plotDif=TRUE,xlab='New Dose',ylab='Y Diff',ylim=c(-5,15))
#plot(e49,plotDif=TRUE,xlab='New Dose',ylab='Y Diff',ylim=c(-5,15), log=TRUE)

e13<-D1[13]
plot(e13)

### standard test with clev
plot(e13,xlab='New Dose',ylab='Y',ylim=c(0,20),plotPop='3',clev=0.9)
#plot(e13,xlab='New Dose',ylab='Y',ylim=c(0,20),plotPop='3',clev=0.9, log=TRUE)


### pbo diff
plot(e13,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15))
#plot(e13,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15), log=TRUE)

##############################################################################
#### binary
set.seed(12357)
nsim<-50

doselev<-c(0,0.033,2*0.033,4*0.033,8*0.033,16*0.033)
ndose<-length(doselev)
n<-rep(95,ndose)
###########################################
#### use pop emax model 
e0<-qlogis(.2)
ed50<-0.15
lambda<-1
emax<-qlogis(0.55)-e0
pop<-c(log(ed50),lambda,emax,e0)
meanlev<-plogis(emaxfun(doselev,parm=pop))

gen.parm<-FixedMean(n,doselev,meanlev,sdy,parm=pop,binary=TRUE)  

prior<-prior.control(0,4,0,4,.5,edDF=5,binary=TRUE)
mcmc<-mcmc.control(chains=1,warmup=500,iter=3000,seed=53453,propInit=0.15,adapt_delta = .9)

D5 <- emaxsimB(nsim,gen.parm,prior=prior,modType=4,binary=TRUE,
							 mcmc=mcmc)

plot(D5[1])
#plot(D5[1], log=TRUE)

plot(D5[1],plotDif=TRUE)
#plot(D5[1],plotDif=TRUE, log=TRUE)

plot(D5[1],plotPop='4')
#plot(D5[1],plotPop='4', log=TRUE)


### repeat with 3 parm model
set.seed(12357)
D6 <- emaxsimB(nsim,gen.parm,prior=prior,modType=3,mcmc=mcmc,binary=TRUE)

plot(D6[1])
#plot(D6[1], log=TRUE)

plot(D6[1],plotDif=TRUE)
#plot(D6[1],plotDif=TRUE, log=TRUE)

plot(D6[1],plotPop='4')
#plot(D6[1],plotPop='4', log=TRUE)

dev.off()


