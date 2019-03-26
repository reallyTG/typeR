library(rmutil)


### Name: DataMethods
### Title: Methods for response, tccov, tvcov, and repeated Data Objects
### Aliases: DataMethods as.data.frame as.data.frame.repeated
###   as.data.frame.response as.data.frame.tccov as.data.frame.tvcov
###   as.matrix as.matrix.repeated as.matrix.response as.matrix.tccov
###   as.matrix.tvcov coef.gnlm covariates covariates.tccov
###   covariates.tvcov covariates.repeated covind covind.default delta
###   delta.response delta.repeated description description.default
###   description.repeated deviance.gnlm df.residual.gnlm formula
###   formula.tccov formula.repeated names names.response names.tccov
###   names.tvcov names.repeated nesting nesting.response nesting.repeated
###   nobs nobs.default nobs.response nobs.tvcov nobs.data.frame
###   plot.response plot.repeated print.response print.tccov print.tvcov
###   print.repeated print.fmobj print.gnlm response response.response
###   response.repeated resptype resptype.response resptype.repeated times
###   times.default times.response transform transform.response
###   transform.tccov transform.tvcov transform.repeated units
###   units.default units.repeated vcov.gnlm weights weights.response
###   weights.repeated weights.gnlm
### Keywords: manip

### ** Examples

# set up some data and create the objects
#
y <- matrix(rnorm(20),ncol=5)
tt <- c(1,3,6,10,15)
print(resp <- restovec(y, times=tt, units="m", type="duration"))
x <- c(0,0,1,1)
x2 <- as.factor(c("a","b","a","b"))
tcc <- tcctomat(data.frame(x=x,x2=x2))
z <- matrix(rpois(20,5),ncol=5)
tvc <- tvctomat(z)
print(reps <- rmna(resp, tvcov=tvc, ccov=tcc))
#
plot(resp)
plot(reps)
plot(reps, nind=1:2)
plot(reps, ccov=c(0,1))
plot(reps, ccov="x2")
plot(reps, name="z", nind=3:4, pch=1:2)
plot(reps, name="z", ccov="x2")
#
response(resp)
response(transform(resp, y=1/y))
response(reps)
response(reps, nind=2:3)
response(transform(reps,y=1/y))
#
times(resp)
times(transform(resp,times=times-6))
times(reps)
#
delta(resp)
delta(reps)
delta(transform(reps,y=1/y))
delta(transform(reps,y=1/y), nind=3)
#
nobs(resp)
nobs(tvc)
nobs(reps)
#
units(resp)
units(reps)
#
resptype(resp)
resptype(reps)
#
weights(resp)
weights(reps)
#
covariates(tcc)
covariates(tcc, nind=2:3)
covariates(tvc)
covariates(tvc, nind=3)
covariates(reps)
covariates(reps, nind=3)
covariates(reps,names="x")
covariates(reps,names="z")
#
names(tcc)
names(tvc)
names(reps)
#
nesting(resp)
nesting(reps)
#
# because individuals are the only nesting, this is the same as
covind(resp)
covind(reps)
#
as.data.frame(resp)
as.data.frame(tcc)
as.data.frame(tvc)
as.data.frame(reps)
#
# use in glm
rm(y,x,z)
glm(y~x+z, data=as.data.frame(reps))



