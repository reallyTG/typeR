### R code from vignette source 'LFDREmpiricalBayes.Rnw'

###################################################
### code chunk number 1: installation_thispkg (eval = FALSE)
###################################################
## source("https://bioconductor.org/biocLite.R")
## biocLite("LFDREmpiricalBayes")


###################################################
### code chunk number 2: installation_qvalue (eval = FALSE)
###################################################
## install.packages(c("LFDR.MLE","matrixStats","stats"))


###################################################
### code chunk number 3: loadPkgs (eval = FALSE)
###################################################
## library(LFDR.MLE)
## library(matrixStats)
## library(stats)


###################################################
### code chunk number 4: generating artificial SNPs
###################################################
#import function "lfdr.mle" from package "LFDR.MLE"
library(LFDR.MLE)

##From the simulation study, create artificial SNPs and obtain test statistics.
sdORS<-sdORC<-sqrt(.02) #some parameters required for simulation.
real.OR1.S<-1.25
real.OR1.C<-1.25

nS1<-0  ##Number of artificial SNPs associated with a
## disease in a separate reference class.
nS2<-20 ## Number of artificial SNPs not associated with
## a specific disease in a separate reference class.
nC1<-20 ##Number of artificial SNPs associated with a specific disease
## outside the separate reference class but inside a combined reference class.
nC2<-0 ##Number of artificial SNPs not associated with a specific disease
## outside the separate reference class but inside a combined reference class.

##zS1 generates test statistics for artificial SNPs associated with a
##specific disease in the separate reference class.
zS1<-rnorm(nS1,mean=log(real.OR1.S),sd=sdORS)
##zS2 generates test statistics for artificial SNPs not associated with a
##specific disease in the separate reference class.
zS2<-rnorm(nS2,mean=log(1),sd=sdORS)##
zSmall<-c(zS1,zS2) ## test statistics from the 20 artificial SNPs

##zC1 generates test statistics for artificial SNPs associated with a specific
##disease in the combined reference class.
zC1<-rnorm(nC1,mean=log(real.OR1.C),sd=sdORC)
##zC2 generates test statistics for artificial SNPs not associated with a
##specific disease in the combined reference class.
zC2<-rnorm(nC2,mean=log(1),sd=sdORC)
zBig<-c(zSmall,zC1,zC2) ## test statistics from the 40 artificial SNPs



###################################################
### code chunk number 5: obtaining lfdr estimates
###################################################
##Then obtain chi-square test statistics
## Separate reference class
xS1<-(zS1/sdORS)^2
xS2<-(zS2/sdORS)^2
xSmall<-c(xS1,xS2) ##chi-square test statistics from 20 SNPs
## Combined reference class
xC1<-(zC1/sdORC)^2
xC2<-(zC2/sdORC)^2
xBig<-c(xSmall,xC1,xC2) ##chi-square test-statistics from 40 SNPs

#Using lfdr.mle, a series of arguments are used.
dFUN=dchisq;df=1;
lower.ncp = .1;upper.ncp = 5
lower.p0 = 0;upper.p0 = 1;

#Estimate the corresponding LFDRs using lfdr.mle
## Separate reference class
opt.S<-lfdr.mle(x =xSmall, dFUN = dFUN, lower.ncp = lower.ncp, upper.ncp = upper.ncp,
                lower.p0 = lower.p0, upper.p0 = upper.p0,df=df)
lfdr.S <- opt.S$LFDR.hat ## Estimate the corresponding LFDRs
p0.S<-opt.S$p0.hat
ncp.S<-opt.S$ncp.hat

## Combined reference class
opt.C<-lfdr.mle(x =xBig, dFUN = dFUN, lower.ncp = lower.ncp, upper.ncp = upper.ncp,
                lower.p0 = lower.p0, upper.p0 = upper.p0,df=df)
lfdr.C <- opt.C$LFDR.hat
p0.C<-opt.C$p0.hat
ncp.C<-opt.C$ncp.hat



###################################################
### code chunk number 6: ME.log
###################################################

##### 26-11-2016

########################################################
log.likelihood<-function(x,p0.hat,ncp.hat){
    (sum(log(p0.hat*dchisq(x,df=1,ncp=0)+(1-p0.hat)*dchisq(x,df=1,ncp=ncp.hat))))
}
########################################################
log.likelihood1<-function(p0,ncp,stat){
    log.sum<-0
    for ( i in 1:length(stat)){
        log1<-log(p0*dchisq(stat[i],df=1,ncp=0)+(1-p0)*dchisq(stat[i],df=1,ncp=ncp))
        log.sum<-log.sum+log1
    }
    return(log.sum)
}
########################################################
true.lfdr<-function(stat,pi0,ncp){
  true.lfdrs<-c()
  for (i in 1:length(pi0)){
    f0<-dchisq(stat, df=1, ncp = 0)
    f1<-dchisq(stat, df=1, ncp = ncp[i])
    true<-(pi0[i]*f0)/((pi0[i]*f0)+(1-pi0[i])*f1)
    true.lfdrs<-rbind(true.lfdrs,true)
  }
  return(true.lfdrs)
}
########################################################
ME.log<-function(stat,lfdr.C,p0.C,ncp.C,p0.S,ncp.S,a=3,lower.p0=0,upper.p0=1,lower.ncp=0.1,
                 upper.ncp=50,length.p0=200,length.ncp=200){
  if (log.likelihood(stat,p0.C,ncp.C)-log.likelihood(stat,p0.S,ncp.S) > -(a*log(2))) {
    LFDR.ME<-lfdr.C
    opt.vect<-cbind(p0.C,ncp.C)
    colnames(opt.vect)<-c('p0','ncp')
    results<-list(p0.hat=opt.vect[,'p0'],ncp.hat=opt.vect[,'ncp'],LFDR.hat=LFDR.ME)
  }else{
    p0<-seq(lower.p0,upper.p0,length=length.p0)
    ncp<-seq(lower.ncp,upper.ncp,length=length.ncp)
    #outer(p0,ncp)
    like1<- outer(p0,ncp, function(x,y) log.likelihood1(x,y,stat))
    plausible<-which(like1-log.likelihood1(p0.S,ncp.S,stat)+a*log(2)>0, arr.ind = TRUE)
    #like1[plausible]
    p0<-p0[plausible[,1]]
    ncp<-ncp[plausible[,2]]
    #plot(1:1000,p0[1:1000])
    #plot(ncp)
    #y<-true.lfdr(stat,p0,ncp)
    #cbind(colMins(y),colMaxs(y))
    ls<-length(stat)
    ME<-rep(NA,ls)
    p0.ME<-rep(NA,ls)
    ncp.ME<-rep(NA,ls)
    y<-true.lfdr(stat,p0,ncp)
    #dim(y)
    cminy<-colMins(y)
    cmaxy<-colMaxs(y)
    for ( i in 1:ls){
        if (lfdr.C[i]<cminy[i]) {
            ME[i]<-cminy[i]
            wpc1<-which(y[,i]==cminy[i])
            p0.ME[i]<-p0[wpc1]
            ncp.ME[i]<-ncp[wpc1]
        }else if (lfdr.C[i]>cmaxy[i]) {
            ME[i]<-cmaxy[i]
            wpc2<-which(y[,i]==cmaxy[i])
            p0.ME[i]<-p0[wpc2]
            ncp.ME[i]<-ncp[wpc2]
    }else{
        ME[i]<-lfdr.C[i]
        p0.ME[i]<-p0.C
        ncp.ME[i]<-ncp.C
      }
    }

    results<-list(p0.hat=p0.ME,ncp.hat=ncp.ME,LFDR.hat=ME)
  }
  return(results)
}
########################################################



###################################################
### code chunk number 7: example from ME.log
###################################################
library(stats)
library(matrixStats)
# Using lfdr.mle, a series of arguments are used.
## if ommitted they will have the default values.
LFDR.ME<-ME.log(xSmall,lfdr.C,p0.C,ncp.C,p0.S,ncp.S,a=3,lower.p0=0,upper.p0=1,lower.ncp=0.1,
                upper.ncp=50,length.p0=200,length.ncp=200)

LFDR.ME



###################################################
### code chunk number 8: caution.parameter.actions
###################################################
library(matrixStats)
caution.parameter.actions<- function (x1,x2,l1=4,l2=1) {
  # l1 and l2 are our definition of the loss values. Take l1=4 amd l2=1
  threshold=l2/(l1+l2)      # threshold for deriving the Bayes actions

  if(length(x1) != length(x2)){
    stop("Error: Vectors must be of equal length.")
  }

  if((l1 <= 0) || (l2 <= 0)){
    stop("Error: Loss values must be greater than 0.")
  }

  for(i in 1:length(x1)){
    if((x1[i] < 0 || x1[i] > 1)||(x2[i] < 0 || x2[i] > 1)){
      stop("Error: Each index in vector x1 or x2 must contain a value between 0 and 1.")
    }
  }

  x <- cbind(x1,x2)
  infx <- rowMins(x) # infimum of LFDRs for each variant
  supx <- rowMaxs(x) # supremum of LFDRs for each variant
  l <- length(infx)
  CG1<-CG0<-CG0.5<-c()
  for (i in 1:l){
    # To construct the CGMinimax rule (caution parameter index 1)
    if (l1*supx[i] <= l2*(1-infx[i])){CGM1 <- 1}else {CGM1 <- 0}
    # To construct the CGMinimin rule (caution parameter index 0)
    if (l1*infx[i] <= l2*(1-supx[i])){CGM0 <- 1}else {CGM0 <- 0}
    # To construct the third action with caution parameter index 1/2
    if (l1*(supx[i]+infx[i]) <= l2*(2-supx[i]-infx[i])){CGM0.5 <-1}else{CGM0.5<- 0}
    CG1 <- c(CG1,CGM1)
    CG0 <- c(CG0,CGM0)
    CG0.5 <- c(CG0.5,CGM0.5)
  }

 # cat("\nGiven a threshold of: ", threshold, "\n\n")
  return(list(CGM1=CG1,CGM0=CG0,CGM0.5=CG0.5))
}



###################################################
### code chunk number 9: Example1_caution.parameter.actions
###################################################
LFDR.Separate <- c(.14,.8,.16,.30)
LFDR.Combined <- c(.21,.61,.12,.10)

output <- caution.parameter.actions(LFDR.Separate, LFDR.Combined)
output


###################################################
### code chunk number 10: SEL.caution.parameter
###################################################
SEL.caution.parameter <- function (x1,x2) {

  if(length(x1) != length(x2)){
    stop("Vectors must be of equal length.")
  }

  for(i in 1:length(x1)){
    if((x1[i] < 0 || x1[i] > 1)||(x2[i] < 0 || x2[i] > 1)){
      stop("Each index in vector x1 or x2 must contain a value between 0
           and 1.")
    }
  }

  x <- cbind(x1,x2)
  infx <- rowMaxs(x)
  supx <- rowMins(x)
  CG1<-CG0.5<-c()
  for (i in 1: length(x1)){
    if (supx[i]<=0.5){
      CGM1 <- 1-supx[i]
      CGM0.5 <- 1-infx[i]
    }else if (infx[i]>0.5){
      CGM1 <- 1-infx[i]
      CGM0.5 <- 1-supx[i]
    }else {
      CGM1 <- 0.5
      k <- infx[i]+supx[i]
      if (k <= 1){
        CGM0.5 <- 1-infx[i]
      }else{
        CGM0.5 <- 1-supx[i]
      }
    }
    CG1 <- c(CG1,CGM1)
    CG0.5 <- c(CG0.5,CGM0.5)
  }
  CG0<-1-(x1+x2)/2
  return(list(CGM1=CG1,CGM0=CG0,CGM0.5=CG0.5))
}



###################################################
### code chunk number 11: Example1_SEL.caution.parameter
###################################################
LFDR.Separate <- c(.14,.8,.16,.3)
LFDR.Combined <- c(.21,.61,.12,.1)

output <- SEL.caution.parameter(LFDR.Separate, LFDR.Combined)
output


###################################################
### code chunk number 12: PRGM.action
###################################################
PRGM.action <- function (x1,x2) {
  PR=1-(x1+x2)/2
  return(list(PRGM=PR))
}


###################################################
### code chunk number 13: PRGM.action_Example 1
###################################################
LFDR.Separate <- c(.14,.8,.16,.3)
LFDR.Combined <- c(.21,.61,.12,.1)

output <- PRGM.action(x1 = LFDR.Separate, x2 = LFDR.Combined)
output


