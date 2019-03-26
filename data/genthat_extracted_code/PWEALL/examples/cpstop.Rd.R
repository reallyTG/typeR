library(PWEALL)


### Name: cpstop
### Title: The stopping probability based on the stopping boundary
### Aliases: cpstop
### Keywords: stopping probability

### ** Examples

###Calculate the stopping boundary at 10-90 percent of the target 300 events 
###when the condition power are c(0.2,0.3,0.4) with 2:1 allocation ratio 
###between the treatment group and the control group, we pick the boundary 
###based on 20 percent conditional power according to design, i.e. under alternative
targetD<-800 ###target number of events at study end
#############Allocation prob for the treatment group#############
pi1<-2/3
propevent<-seq(0.1,0.9,by=0.1) ###proportion of events at interim
HRbound<-cpboundary(Dplan=targetD,pi1=pi1,prop=propevent)$CPDbound[,1]  ###picking a boundary
pa<-cpstop(pi1=pi1,HRbound=HRbound)    ###stopping probabilities under null and alternative  
pa

###Calculate the stopping probability under non-constant hazard ratio
n1<-length(propevent)

####time point at which hazard rates and hazard ratios change
tchange<-c(0,6,12,24)                       
###annual event rates=0.09(1st yr), 0.07(2nd yr) and 0.05(2+yr) for control
ratet<-c(0.09/12,0.09/12,0.07/12,0.05/12)   
###annual censoring rate=0%(1st yr) and 1.5%(after) for control and treatment
ratec0<-c(0/12,0/12,0.015/12,0.015/12)      
ratec1<-ratec0                              
###annual treatment discontinuation rate=4% (1st yr) and 3% (after)
rate31<-c(0.04/12,0.04/12,0.03/12,0.03/12)  
rate30<-rep(0,length(tchange))              

############Recruitment curve##################
oa<-c(100,200,300,300,400,400,400,400,400,400,400,400,300,200)
ntotal<-sum(oa)
ntotal

taur<-length(oa)
ut<-seq(1,taur,by=1)
u<-oa/ntotal


#############Type-1 error rate#############
alpha<-0.05

####null hypothesis
eta0<-log(1)

####constant HR
etac<-log(0.8)

####non-constant HR
eta<-c(log(1),log(0.75),log(0.75),log(0.75)) ###6-m delayed 


####target number of events where calculations are performed##############
sevent<-propevent*targetD
nse<-length(sevent)
xtimeline<-xbeta<-xvar<-pxstop<-matrix(0,ncol=2,nrow=nse)
xtimeline[,1]<-xbeta[,1]<-xvar[,1]<-pxstop[,1]<-sevent
i<-1
tbegin<-proc.time()
for (i in 1:nse){
###find timeline
xtimeline[i,2]<-pwecxpwufindt(target=sevent[i],ntotal=ntotal,
                taur=taur,u=u,ut=ut,pi1=0.5,
                rate11=exp(eta)*ratet,rate21=exp(eta)*ratet,rate31=rate31,ratec1=ratec1,
                rate10=ratet,rate20=ratet,rate30=rate30,ratec0=ratec0,
                tchange=tchange,eps=0.001,init=taur,epsilon=0.000001,maxiter=100)$tau1

#Overall hazard ratio and varaince
xbeta[i,2]<-ovbeta(tfix=xtimeline[i,2],taur=taur,u=u,ut=ut,pi1=pi1,
                rate11=exp(eta)*ratet,rate21=exp(eta)*ratet,rate31=rate31,ratec1=ratec1,
                rate10=ratet,rate20=ratet,rate30=rate30,ratec0=ratec0,
                tchange=tchange,eps=0.001,veps=0.001,epsbeta=1.0e-10)$b1
xvar[i,2]<-overallvar(tfix=xtimeline[i,2],taur=taur,u=u,ut=ut,pi1=pi1,
                rate11=exp(eta)*ratet,rate21=exp(eta)*ratet,rate31=rate31,ratec1=ratec1,
                rate10=ratet,rate20=ratet,rate30=rate30,ratec0=ratec0,
                tchange=tchange,eps=0.001,veps=0.001,beta=xbeta[i,2])$vbeta
}
##stopping prob
pxstop[,2]<-1-pnorm(sqrt(ntotal)*(log(HRbound)-xbeta[,2])/sqrt(xvar[,2]))
tend<-proc.time()

xout<-cbind(xtimeline[,1],xtimeline[,2],xbeta[,2],xvar[,2]/ntotal,
            1/pi1/(1-pi1)/xtimeline[,1],pxstop[,2],pa$pstop0,pa$pstop1)
xnames<-c("# of events", "Time", "Estbeta", "TrueV", "ApproxV", "NCHR", "Null", "CHR")
colnames(xout)<-xnames
options(digits=2)
xout



