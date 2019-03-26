library(multistate)


### Name: m3
### Title: 3-State Time-Inhomogeneous Markov Model
### Aliases: m3
### Keywords: Markov

### ** Examples


# import the observed data
# X=1 corresponds to initial state with a functioning graft, X=2 to acute rejection episode, 
# X=3 to return to dialysis, and X=4 to death with a functioning graft

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT$id<-c(1:nrow(dataDIVAT))
set.seed(2)
d3<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 300, replace = FALSE),]

# Individuals with trajectory 13 and 123 are 
# censored at the time of transition into state X=3

d3$trajectory[d3$trajectory==13]<-1
d3$trajectory[d3$trajectory==123]<-12
d3$trajectory[d3$trajectory==14]<-13
d3$trajectory[d3$trajectory==124]<-123

# 3-state parametric Markov model including one explicative variable 
# (z is the delayed graft function) on the transition 1->2. We only reduced
# the precision and the number of iteration to save time in this example,
# prefer the default values.

m3(t1=d3$time1, t2=d3$time2, sequence=d3$trajectory, weights=NULL,
  dist=c("E","E","E"), ini.dist.12=c(9.93),
  ini.dist.13=c(11.54), ini.dist.23=c(10.21),
  cov.12=d3$z, init.cov.12=c(-0.13), names.12=c("beta12_z"),
  conf.int=TRUE,  silent=FALSE, precision=0.001)



