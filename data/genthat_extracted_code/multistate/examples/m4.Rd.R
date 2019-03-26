library(multistate)


### Name: m4
### Title: 4-State Time-Inhomogeneous Markov Model
### Aliases: m4
### Keywords: Markov

### ** Examples

# import the observed data
# (X=1 corresponds to initial state with a functioning graft, X=2 to acute rejection episode, 
# X=3 to return to dialysis, X=4 to death with a functioning graft)

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT$id<-c(1:nrow(dataDIVAT))
set.seed(2)
d4<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 200, replace = FALSE),]

# 4-state parametric Markov model including one explicative variable ('z') 
# on the trainsition from X=1 to X=2. We only reduced
# the precision and the number of iteration to save time in this example,
# prefer the default values.

m4(t1=d4$time1, t2=d4$time2, sequence=d4$trajectory, dist=c("E","E","E","E","E"),
  ini.base.12=c(8.31), ini.base.13=c(10.46), ini.base.14=c(10.83),
  ini.base.23=c(9.01), ini.base.24=c(10.81),
  cov.12=d4$z, init.cov.12=c(-0.02), names.12=c("beta12_z") ,
  conf.int=TRUE, silent=FALSE, precision=0.001)$table



