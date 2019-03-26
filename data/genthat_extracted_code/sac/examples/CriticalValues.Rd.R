library(sac)


### Name: CriticalValues
### Title: Critical Values of Tests of Change-Point(s) with One-Change or
###   Epidemic Alternative
### Aliases: Sn.alfa CV.Epidemic.Vn CV.Epidemic.Wn
### Keywords: htest

### ** Examples

require(sac) #load the package
alpha<-0.05
n<-20
d<-1
Sn.alfa(alpha, n, d, model="semiparametric")
CV.Epidemic.Vn(alpha, d)
CV.Epidemic.Wn(alpha)



