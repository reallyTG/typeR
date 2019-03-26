library(multistate)


### Name: pred.mm2
### Title: Cumulative Incidence Function form Horizontal Mixture Model with
###   Two Competing Events
### Aliases: pred.mm2
### Keywords: competing events

### ** Examples

# import the observed data
# X=1 corresponds to initial state with a functioning graft,
# X=2 to acute rejection episode (transient state), 
# X=3 to return to dialysis, X=4 to death with a functioning graft

data(dataDIVAT)

dim(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT$id<-c(1:nrow(dataDIVAT))
set.seed(2)
d2<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 300, replace = FALSE),]

# Data-management: two competing events
# the patient death is now X=2
# the return in dialysis is now X=3

d2$time<-NA
d2$time[d2$trajectory==1]<-d2$time1[d2$trajectory==1]

d2$time[d2$trajectory==12]<-d2$time2[d2$trajectory==12]
d2$trajectory[d2$trajectory==12]<-1

d2$time[d2$trajectory==13]<-d2$time1[d2$trajectory==13]

d2$time[d2$trajectory==123]<-d2$time2[d2$trajectory==123]
d2$trajectory[d2$trajectory==123]<-13

d2$time[d2$trajectory==14]<-d2$time1[d2$trajectory==14]

d2$time[d2$trajectory==124]<-d2$time2[d2$trajectory==124]
d2$trajectory[d2$trajectory==124]<-14

d2$trajectory[d2$trajectory==14]<-12

table(d2$trajectory)

# Univariable horizontal mixture model one binary explicative variable
# z is 1 if delayed graft function and 0 otherwise

mm2.model <- mm2(t=d2$time, sequence=d2$trajectory, weights=NULL,
  dist=c("E","W"), cuts.12=NULL, cuts.13=NULL, 
  ini.dist.12=c(9.28), ini.dist.13=c(9.92, -0.23), 
  cov.12=d2$z, init.cov.12=0.84, names.12="beta_12",
  cov.13=d2$z, init.cov.13=0.76, names.13="beta_13",
  cov.p=NULL, init.cov.p=NULL, names.p=NULL, init.intercept.p=-0.75,
  conf.int=TRUE, silent=FALSE)

cif2.mm2 <- pred.mm2(mm2.model, event=2, times=seq(0, 4000, by=30),
 cov.12=c(0,1), cov.13=c(0,1), cov.p=NULL)

plot(cif2.mm2$times/365.25, cif2.mm2$cif[1,], col = 1, type="l", lty = 1,
 ylim=c(0,1), lwd =2, ylab="Cumulative Incidence Function",
 xlab="Times (years)", main="", xlim=c(0, 11), legend=FALSE)

lines(cif2.mm2$times/365.25, cif2.mm2$cif[2,], lwd=2, col=2)



