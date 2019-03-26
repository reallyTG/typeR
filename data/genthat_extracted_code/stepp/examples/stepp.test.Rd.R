library(stepp)


### Name: stepp.test
### Title: The constructor to generate a complete steppes object with
###   effect estimates and test statistics
### Aliases: stepp.test
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(bigCI)

rxgroup <- bigCI$trt
time    <- bigCI$time
evt     <- bigCI$event
cov     <- bigCI$ki67

#
# using constructor functions
swin    <- stepp.win(type="sliding", r1=50, r2=150)
subp    <- stepp.subpop(swin=swin, cov=cov)
summary(subp)

smodel  <- stepp.CI(coltrt=rxgroup, trts=c(1,2), coltime=time, coltype=evt, timePoint=4)
# Warning: In this example, the permutations have been set to 0 to allow the function
# to finish in a short amount of time.  IT IS RECOMMEND TO USE AT LEAST 2500 PERMUTATIONS TO 
# PROVIDE STABLE RESULTS.
statCI  <- stepp.test(subpop=subp, model=smodel, nperm=0)




