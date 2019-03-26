library(DOBAD)


### Name: add.joint.mean.many
### Title: Mean counts and particle time averages for birth-death processes
###   with immigration
### Aliases: add.joint.mean.many rem.joint.mean.many
###   timeave.joint.mean.many add.joint.mean.one rem.joint.mean.one
###   timeave.joint.mean.one add.cond.mean.many rem.cond.mean.many
###   timeave.cond.mean.many add.cond.mean.one rem.cond.mean.one
###   timeave.cond.mean.one hold.cond.mean.one add.joint.meanSq.one
###   add.cond.meanSq.one addrem.joint.mean.one addrem.cond.mean.one
###   addhold.joint.mean.one addhold.cond.mean.one remhold.joint.mean.one
###   remhold.cond.mean.one add.joint.meanSq.one add.cond.meanSq.one
###   rem.joint.meanSq.one rem.cond.meanSq.one hold.joint.meanSq.one
###   hold.cond.meanSq.one all.cond.mean.PO all.cond.mean2.PO
### Keywords: math

### ** Examples

library(DOBAD)
my.lambda = 2
my.mu = 3
my.nu =1
my.time = 0.5
my.start = 10
my.end = 2
my.n = 1024

#Calculate the mean number of additions (births and immigrations)
#conditional on "my.start" particles at time 0 and "my.end" particles at time "my.time"
add.cond.mean.one(t=my.time,lambda=my.lambda,mu=my.mu,nu=my.nu,X0=my.start,Xt=my.end)

#Calculate a vector mean number of deaths joint with "my.end" particles at
# time "my.time" and conditional on "my.start" particles at time 0
DOBAD:::rem.joint.mean.one(t=my.time,lambda=my.lambda,mu=my.mu,nu=my.nu,X0=my.start,Xt=my.end)

#Calculate a vector mean particle time averages conditional on
# "my.start" particles at time 0 and 1 to "my.n" particles at time "my.time" 
# WARNING: conditional expectations for large values of |X_0-X_t| may be
# unreliable
timeave.cond.mean.many(t=my.time,lambda=my.lambda,mu=my.mu,nu=my.nu,X0=my.start,n=my.n)[1:20]



