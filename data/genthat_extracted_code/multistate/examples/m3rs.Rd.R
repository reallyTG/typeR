library(multistate)


### Name: m3rs
### Title: 3-state Relative Survival Markov Model with Additive Risks
### Aliases: m3rs
### Keywords: Markov relative survival

### ** Examples

# import the observed data
# (X=1 corresponds to initial state with a functioning graft, X=2 to acute rejection episode, 
# X=3 to return to dialysis, X=4 to death with a functioning graft)

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT$id<-c(1:nrow(dataDIVAT))
set.seed(2)
d3<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 200, replace = FALSE),]

# Individuals with trajectory 13 and 123 are 
# censored at the time of transition into state X=3

d3$trajectory[d3$trajectory==13]<-1
d3$trajectory[d3$trajectory==123]<-12
d3$trajectory[d3$trajectory==14]<-13
d3$trajectory[d3$trajectory==124]<-123

# import the expected mortality rates

data(fr.ratetable)

# 3-state Markov model with additive risks including one explicative variable 
# (z is the delayed graft function) on all transitions. We only reduced
# the precision and the number of iteration to save time in this example,
# prefer the default values.

m3rs(t1=d3$time1, t2=d3$time2, sequence=d3$trajectory,
  dist=c("E","E","E"), ini.dist.12=c(8.34),
  ini.dist.13=c(10.70), ini.dist.23=c(11.10),
  cov.12=d3$z, init.cov.12=c(0.04), names.12=c("beta12_z"),
  cov.13=d3$z, init.cov.13=c(1.04), names.13=c("beta1E_z"),
  cov.23=d3$z, init.cov.23=c(0.29), names.23=c("beta2E_z"),
  p.age=d3$ageR*365.24, p.sex=d3$sexR,
  p.year=as.date(paste("01","01",d3$year.tx),order = "mdy"),
  p.rate.table=fr.ratetable,  conf.int=TRUE,
  silent=FALSE, precision=0.001)



