library(rmutil)


### Name: restovec
### Title: Create a response Object
### Aliases: restovec
### Keywords: manip

### ** Examples

#
#continuous response
y <- matrix(rnorm(20),ncol=5)
# times assumed to be 1:5
restovec(y, units="m")
#unequally-spaced times
tt <- c(1,3,6,10,15)
print(resp <- restovec(y, times=tt, units="m",
	description=list(y="Response measured in metres")))
response(resp)
response(resp, nind=2:3)
response(transform(resp, y=1/y))
transform(resp, y=1/y, units="1/m")
units(resp)
description(resp)
times(resp)
times(transform(resp, times=times-6))
nobs(resp)
weights(resp)
nesting(resp)
# because individuals are the only nesting, this is the same as
covind(resp)
#
# binomial response
y <- matrix(rpois(20,5),ncol=5)
# responses summarized as relative frequencies
print(respb <- restovec(y, totals=y+matrix(rpois(20,5),ncol=5), times=tt))
response(respb)
#
# censored data
y <- matrix(rweibull(20,2,5),ncol=5)
print(respc <- restovec(y, censor=matrix(rbinom(20,1,0.9),ncol=5), times=tt))
# if there is no censoring, censor indicator is not printed
response(respc)
# nesting clustered within individuals
nest <- c(1,1,2,2,2)
print(respn <- restovec(y, censor=matrix(rbinom(20,1,0.9),ncol=5),
	times=tt,nest=nest))
response(respn)
times(respn)
nesting(respn)
#
# multivariate response
restovec(y, censor=matrix(rbinom(20,1,0.9),ncol=5),
	units=c("m","days","l","cm","mon"),
	type=c("continuous","duration","continuous","continuous","duration"),
	description=list(y1="First continuous variable",
		y2="First duration variable",y3="Second continuous variable",
		y4="Third continuous variable",y5="Second duration variable"))
restovec(y, censor=matrix(rbinom(20,1,0.9),ncol=5), 
	names=c("a","b","c","d","e"), units=c("m","days","l","cm","mon"),
	type=c("continuous","duration","continuous","continuous","duration"),
	description=list(a="First continuous variable",
		b="First duration variable",c="Second continuous variable",
		d="Third continuous variable",e="Second duration variable"))



