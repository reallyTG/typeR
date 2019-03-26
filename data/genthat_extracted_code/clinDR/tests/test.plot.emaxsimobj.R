library(clinDR)


if(file.exists("./clinDR/inst/tests/extraGraphics/pdfoutput")){
	pvar<-"./clinDR/inst/tests/extraGraphics/pdfoutput"
} else pvar<-NULL

if(file.exists(file.path(pvar,"output.emaxsimobj_new.pdf"))) file.rename(file.path(pvar,"output.emaxsimobj_new.pdf"), 
																																				 file.path(pvar,"output.emaxsimobj_old.pdf"))
	
pdf(file=paste(file.path(pvar,"output.emaxsimobj_new.pdf")))

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
D1 <- emaxsim(nsim,gen.parm)
e49<-D1[49]

#####################################################################
####
plot(e49)
plot(e49, xat=c(0, 5, 25, 100))


plot(e49, log=TRUE)
plot(e49, log=TRUE, xat=c(0, 5, 25, 100))

### standard test with clev
plot(e49,clev=0.70)  
plot(e49,clev=0.70, log=TRUE)

plot(e49,xlab='New Dose',ylab='Y',ylim=c(-5,15),plotPop='3',clev=0.9)
plot(e49,xlab='New Dose',ylab='Y',ylim=c(-5,15),plotPop='3',clev=0.9, log=TRUE)
### pbo diff
plot(e49,plotDif=TRUE,xlab='New Dose',ylab='Y Diff',ylim=c(-5,15))
plot(e49,plotDif=TRUE,xlab='New Dose',ylab='Y Diff',ylim=c(-5,15), log=TRUE)

### linear
e7<-D1[7]
plot(e7)
plot(e7, log=TRUE)


### standard test with clev
plot(e7,xlab='New Dose',ylab='Y',ylim=c(0,15),plotPop='3',clev=0.9)
plot(e7,xlab='New Dose',ylab='Y',ylim=c(0,15),plotPop='3',clev=0.9, log=TRUE)

### pbo diff
plot(e7,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15))
plot(e7,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15), log=TRUE)

### exponential
e13<-D1[13]
plot(e13)
plot(e13, log=TRUE)

### standard test with clev
plot(e13,xlab='New Dose',ylab='Y',ylim=c(0,20),plotPop='3',clev=0.9)
plot(e13,xlab='New Dose',ylab='Y',ylim=c(0,20),plotPop='3',clev=0.9, log=TRUE)

### pbo diff
plot(e13,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15))
plot(e13,plotDif=TRUE,xlab='New Dose',ylab='Y Dif',ylim=c(-5,15), log=TRUE)

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

D5 <- emaxsim(nsim,gen.parm,modType=4,binary=TRUE)

plot(D5[1])
plot(D5[1], log=TRUE)

plot(D5[1],plotDif=TRUE)
plot(D5[1],plotDif=TRUE, log=TRUE)

plot(D5[1],plotPop='4')
plot(D5[1],plotPop='4', log=TRUE)

### fitType='E'
plot(D5[4])
plot(D5[4], log=TRUE)

plot(D5[4],plotDif=TRUE)
plot(D5[4],plotDif=TRUE, log=TRUE)

plot(D5[4],plotPop='4')
plot(D5[4],plotPop='4', log=TRUE)

### fitType='L'
plot(D5[20])
plot(D5[20], log=TRUE)

plot(D5[20],plotDif=TRUE)
plot(D5[20],plotDif=TRUE, log=TRUE)

plot(D5[20],plotPop='4')
plot(D5[20],plotPop='4', log=TRUE)

### repeat with 3 parm model
set.seed(12357)
D6 <- emaxsim(nsim,gen.parm,modType=3,binary=TRUE)

plot(D6[1])
plot(D6[1], log=TRUE)

plot(D6[1],plotDif=TRUE)
plot(D6[1],plotDif=TRUE, log=TRUE)

plot(D6[1],plotPop='4')
plot(D6[1],plotPop='4', log=TRUE)

### fitType='E'
plot(D6[4])
plot(D6[4], log=TRUE)

plot(D6[4],plotDif=TRUE)
plot(D6[4],plotDif=TRUE, log=TRUE)

plot(D6[4],plotPop='4')
plot(D6[4],plotPop='4', log=TRUE)

### fitType='L'
plot(D6[20])
plot(D6[20], log=TRUE)

plot(D6[20],plotDif=TRUE)
plot(D6[20],plotDif=TRUE, log=TRUE)

plot(D6[20],plotPop='4')
plot(D6[20],plotPop='4', log=TRUE)


dev.off()


