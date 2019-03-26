library(bdpv)


### Name: nPV
### Title: Asymptotic sample size calculation for inference on negative and
###   positive predictive values in case-control designs.
### Aliases: nPV
### Keywords: htest power sample size

### ** Examples


#Reproducing illustration in Section 3.4 and 4.2 of
#Steinberg et al. (2009)

FIG1<-nPV(se=0.8, sp=0.95, prev=1/16, NPV0=0.98, PPV0=0.4,
 NPVpower = 0.8, PPVpower = 0.8,
 rangeP = c(0.01, 0.99), nsteps = 100, alpha = 0.05)

FIG1

DFIG1<-as.data.frame(FIG1)

plot(x=DFIG1$propP, y=DFIG1[,2], ylim=c(0,2000), lty=1,  type="l",
 ylab="total sample size", xlab="proportion of true positives")
lines(x=DFIG1$propP, y=DFIG1[,3], lty=2 )




