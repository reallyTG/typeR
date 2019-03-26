library(multistate)


### Name: sm4rs
### Title: 4-State Relative Survival Semi-Markov Model with Additive Risks
### Aliases: sm4rs
### Keywords: semi-Markov relative survival

### ** Examples

# import the observed data
# (X=1 corresponds to initial state with a functioning graft, X=2 to acute rejection episode, 
# X=3 to return to dialysis, X=4 to death with a functioning graft)

data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

dataDIVAT$id<-c(1:nrow(dataDIVAT))
set.seed(2)
d4<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 300, replace = FALSE),]

# import the expected mortality rates

data(fr.ratetable)

# 4-state parametric additive relative survival semi-Markov model including one 
# explicative variable (z is the delayed graft function) on the transition from X=1 to X=2

# Note: a semi-Markovian process with sojourn times exponentially distributed
# is a time-homogeneous Markov process

# We only reduced the precision and the number of iteration to save time in this example,
# prefer the default values.

sm4rs(t1=d4$time1, t2=d4$time2, sequence=d4$trajectory, dist=c("E","E","E","E","E"),
  ini.dist.12=c(8.34),  ini.dist.13=c(10.44),  ini.dist.14=c(10.70),
  ini.dist.23=c(9.43),  ini.dist.24=c(11.11),
  cov.12=d4$z, init.cov.12=c(0.04), names.12=c("beta12_z"),
  p.age=d4$ageR*365.24,  p.sex=d4$sexR,
  p.year=as.date(paste("01","01",d4$year.tx), order = "mdy"),
  p.rate.table=fr.ratetable, conf.int=TRUE,
  silent=FALSE, precision=0.001)




