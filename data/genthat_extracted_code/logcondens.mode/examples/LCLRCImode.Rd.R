library(logcondens.mode)


### Name: LCLRCImode
### Title: Compute Log-Concave Likelihood-Ratio Confidence interval for the
###   mode.
### Aliases: LCLRCImode
### Keywords: htest nonparametric

### ** Examples


nn <- 200
myxx <- rnorm(nn) ## no need to sort

LCLRCImode(x=myxx,
           xgrid=NULL,
           w=NA,
           ##nn=nn, 
           alpha=0.05,
           CIprec=1e-04,
           print=FALSE)

LCLRCImode(x=myxx,
           xgrid=.05,
           w=NA,
           ##nn=nn, 
           alpha=0.05,
           CIprec=1e-04,
           print=FALSE)





