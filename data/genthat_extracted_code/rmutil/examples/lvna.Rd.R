library(rmutil)


### Name: lvna
### Title: Create a repeated Object, Leaving NAs
### Aliases: lvna
### Keywords: manip

### ** Examples

y <- matrix(rnorm(20),ncol=5)
y[2,3] <- NA
tt <- c(1,3,6,10,15)
print(resp <- restovec(y,times=tt))
x <- c(0,0,1,1)
tcc <- tcctomat(x)
z <- matrix(rpois(20,5),ncol=5)
tvc <- tvctomat(z)
print(reps <- lvna(resp, tvcov=tvc, ccov=tcc))
response(reps)
response(reps, nind=2:3)
times(reps)
nobs(reps)
weights(reps)
covariates(reps)
covariates(reps,names="x")
covariates(reps,names="z")
names(reps)
nesting(reps)
# because individuals are the only nesting, this is the same as
covind(reps)
# binomial
y <- matrix(rpois(20,5),ncol=5)
y[2,3] <- NA
print(respb <- restovec(y,totals=y+matrix(rpois(20,5),ncol=5),times=tt))
print(repsb <- lvna(respb, tvcov=tvc, ccov=tcc))
response(repsb)
# censored data
y <- matrix(rweibull(20,2,5),ncol=5)
print(respc <- restovec(y,censor=matrix(rbinom(20,1,0.9),ncol=5),times=tt))
print(repsc <- lvna(respc, tvcov=tvc, ccov=tcc))
# if there is no censoring, censor indicator is not printed
response(repsc)
# nesting clustered within individuals
nest <- c(1,1,2,2,2)
print(respn <- restovec(y,censor=matrix(rbinom(20,1,0.9),ncol=5),
	times=tt,nest=nest))
print(repsn <- lvna(respn, tvcov=tvc, ccov=tcc))
response(respn)
times(respn)
nesting(respn)



