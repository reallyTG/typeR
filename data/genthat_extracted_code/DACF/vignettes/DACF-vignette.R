## ----echo=FALSE----------------------------------------------------------
library(DACF)
r.1=rnorm(1000,20,5)
r.2=rnorm(1000,30,5)
r.3=rnorm(1000,10,10)
ca.true=matrix(c(r.1,r.2,r.3,rep(c(2,1,3),each=1000)),ncol=2)
r.2.cf=induce.cfe(0,.3,r.2)
r.3.cf=induce.cfe(.3,0,r.3)
ca.cf=matrix(c(r.1,r.2.cf,r.3.cf,rep(c(2,1,3),each=1000)),ncol=2)
colnames(ca.cf)=c('score','group')

## ------------------------------------------------------------------------
# group sample mean
aggregate(ca.true[,1],mean,by=list(ca.true[,2]))
# group sample variance
aggregate(ca.true[,1],var,by=list(ca.true[,2]))

## ------------------------------------------------------------------------
# group sample mean
aggregate(ca.cf[,1],mean,by=list(ca.cf[,2]))
# grouple sample variance
aggregate(ca.cf[,1],var,by=list(ca.cf[,2]))

## ------------------------------------------------------------------------
# younger-aged group
young=ca.cf[ca.cf[,2]==1,1]
rec.mean.var(young) # true mean and variance are 30 and 25

# the estimated floor and ceiling percentages and the recovered mean and variance estimates are displayed above

# older-aged group
old=ca.cf[ca.cf[,2]==3,1]
rec.mean.var(old) # true mean and variance are 10 and 100

# the estimated floor and ceiling percentages and the recovered mean and variance estimates are displayed above

## ------------------------------------------------------------------------
# ANOVA
lw.f.star(data.frame(ca.cf),score~group,"a")
lw.f.star(data.frame(ca.cf),score~group,"b")
# t-test
lw.t.test(young,old,"a")
lw.t.test(young,old,"b")

## ------------------------------------------------------------------------
# Simulate healthy data for two groups
x.1=rnorm(300,2,4)
x.2=rnorm(300,3,5)
# check mean and variance for simulated healthy data
mean(x.1);var(x.1)
mean(x.2);var(x.2)
# induce ceiling effects of 20% in group 1
x.1.cf=induce.cfe(.2,0,x.1)
# induce floor effects of 10% in group 2
x.2.cf=induce.cfe(0,.1,x.2)
# recover the mean and variance for ceiling/floor data
rec.mean.var(x.1.cf)
rec.mean.var(x.2.cf)
# conduct a t test on healthy data
t.test(x.1,x.2)
t.test(x.1.cf,x.2.cf)
# conduct an adjusted t test on ceiling/floor data
lw.t.test(x.1.cf,x.2.cf,"a")
lw.t.test(x.1.cf,x.2.cf,"b")
# generate a dataframe for ANOVA demo
testdat=threeganova.sim(10000,.0625,1)
# induce ceiling/floor effects in the data
testdat.cf=testdat
testdat.cf[testdat.cf$group==2,]$y=induce.cfe(.2,0,testdat.cf[testdat.cf$group==2,]$y)
# conduct an adjusted F star test on ceiling/floor data
lw.f.star(testdat.cf,y~group,"a")
lw.f.star(testdat.cf,y~group,"b")

