library(bdpv)


### Name: bdpv-package
### Title: Confidence intervals and experimental design for negative and
###   positive predictive values in binary diagnostic tests.
### Aliases: bdpv-package bdpv
### Keywords: package

### ** Examples


# 1) Example data: Mercaldo et al.(2007), Table VIII:

Tab8<-matrix(c(240, 178, 87, 288), ncol=2)
colnames(Tab8)<-c("Case","Control")
rownames(Tab8)<-c("ApoEe4plus","ApoEe4minus")
Tab8

# Assuming prevalence=0.03
BDtest(xmat=Tab8, pr=0.03, conf.level = 0.95)

# Assuming prevalence=0.5
BDtest(xmat=Tab8, pr=0.5, conf.level = 0.95)

# 2) Experimental design acc. to Steinberg et al.(2009)

TEST<-nPV(se=c(0.76, 0.78, 0.80, 0.82, 0.84),
 sp=c(0.93, 0.94, 0.95, 0.96, 0.97),
 pr=0.0625, NPV0=0.98, PPV0=0.25, NPVpower = 0.8, PPVpower = 0.8,
 rangeP = c(0.10, 0.9), nsteps = 20, alpha = 0.05)

TEST

plotnPV(TEST, log="y", legpar=list(x=0.6))


# 3) Simulation of power and coverage probability

simPVmat(se=0.8, sp=0.95, pr=0.0625, n1=c(177, 181), 
 n0=c(554, 87), NPV0=0.98, PPV0=c(0.4, 0.25))






