library(multistate)


### Name: sm3ic
### Title: 3-State Semi-Markov Model with Interval-Censored Data
### Aliases: sm3ic
### Keywords: semi-Markov illness-death interval-censoring

### ** Examples


# The example is too long to compute for a submission on the CRAN
# Remove the characters '#'

# import the observed data (read the application in Gillaizeau et al. for more details)
# X=1 corresponds to initial state with a functioning graft, X=2 to acute rejection episode, 
# X=3 to return to dialysis, X=4 to death with a functioning graft

# data(dataDIVAT)

# A subgroup analysis to reduce the time needed for this example

# dataDIVAT$id<-c(1:nrow(dataDIVAT))
# set.seed(2)
# d3<-dataDIVAT[dataDIVAT$id %in% sample(dataDIVAT$id, 100, replace = FALSE),]

# To illustrate the use of a 3-state model, the return in dialysis are right-censored

# d3$trajectory[d3$trajectory==13]<-1
# d3$trajectory[d3$trajectory==123]<-12
# d3$trajectory[d3$trajectory==14]<-13
# d3$trajectory[d3$trajectory==124]<-123
# table(d3$trajectory)

# X=2 is supposed to be interval-censored between 't0' and 't1' because
# health examinations take place each year after inclusion

# d3$t0<-NA
# d3$t1<-NA
# d3$time2_<-NA

# i<-d3$trajectory==1
# d3$t0[i]<-trunc(d3$time1[i]/365.24)*365.24+1
# d3$t1[i]<-NA
# d3$t2[i]<- d3$time1[i]+1

# i<-d3$trajectory==12
# d3$t0[i]<-trunc(d3$time1[i]/365.24)*365.24+1
# d3$t1[i]<-(trunc(d3$time1[d3$trajectory==12]/365.24)+1)*365.24
# d3$t2[i]<-pmax(d3$time2[i], (trunc(d3$time1[i]/365.24)+2)*365.24)

# i<-d3$trajectory==13
# d3$t0[i]<-trunc(d3$time1[i]/365.24)*365.24+1
# d3$t1[i]<-NA
# d3$t2[i]<-d3$time1[i]

# i<-d3$trajectory==123
# d3$t0[i]<-trunc(d3$time1[i]/365.24)*365.24+1
# d3$t1[i]<-(trunc(d3$time1[i]/365.24)+1)*365.24 
# d3$t2[i]<- pmax(d3$time2[i], (trunc(d3$time1[i]/365.24)+2)*365.24)

# 3-state homogeneous semi-Markov model with interval-censored data 
# including one binary explicative variable (z is 1 if delayed graft function and
# 0 otherwise).
# Estimation of the marginal effect of z on the transition from X=1 to X=2 
# by adjusting for 2 possible confounding factors (age and gender)
# We only reduced the precision and the number of iteration to save time in this example,
# prefer the default values.

# propensity.score <- glm(z ~ ageR + sexR, family=binomial(link="logit"),data=d3)  
# d3$fit<-propensity.score$fitted.values
  
# p1<-mean(d3$z)
# d3$w <- p1/d3$fit
# d3$w[d3$z==0]<-(1-p1)/(1-d3$fit[d3$z==0])
 
# sm3ic(t0=d3$t0, t1=d3$t1, t2=d3$t2, sequence=d3$trajectory, weights=d3$w,
#   dist=c("E","E","E"), cuts.12=NULL, cuts.13=NULL, cuts.23=NULL,
#   ini.dist.12=c(8.23), ini.dist.13=c(10.92), ini.dist.23=c(10.67),
#   cov.12=d3$z, init.cov.12=c(0.02), names.12=c("beta12_z"),
#   conf.int=TRUE, silent=FALSE, precision=0.001, legendre=20)$table



