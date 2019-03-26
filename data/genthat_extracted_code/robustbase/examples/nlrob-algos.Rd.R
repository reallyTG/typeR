library(robustbase)


### Name: nlrob-algorithms
### Title: MM-, Tau-, CM-, and MTL- Estimators for Nonlinear Robust
###   Regression
### Aliases: nlrob.algorithms nlrob.MM nlrob.tau nlrob.CM nlrob.mtl
### Keywords: robust regression nonlinear

### ** Examples

DNase1 <- DNase[DNase$Run == 1,]
form <- density ~ Asym/(1 + exp(( xmid -log(conc) )/scal ))
pnms <- c("Asym", "xmid", "scal")
set.seed(47) # as these by default use randomized optimization:

fMM <- robustbase:::nlrob.MM(form, data = DNase1,
           lower = setNames(c(0,0,0), pnms), upper = 3,
           ## call to nlrob.control to pass 'optim.control':
           ctrl = nlrob.control("MM", optim.control = list(trace = 1),
                                optArgs = list(trace = TRUE)))

## The same via nlrob() {recommended; same random seed to necessarily give the same}:
set.seed(47)
gMM  <- nlrob(form, data = DNase1, method = "MM",
              lower = setNames(c(0,0,0), pnms), upper = 3, trace = TRUE)
gMM
summary(gMM)
## and they are the same {apart from 'call' and 'ctrl' and new stuff in gMM}:
ni <- names(fMM); ni <- ni[is.na(match(ni, c("call","ctrl")))]
stopifnot(all.equal(fMM[ni], gMM[ni]))
## Don't show: 
if(doExtras <- robustbase:::doExtras()) {
 gtau <- nlrob(form, data = DNase1, method = "tau",
	       lower = setNames(c(0,0,0), pnms), upper = 3, trace = TRUE)

 ## these two have "sigma" also as parameter :
 psNms <- c(pnms, "sigma")
 gCM  <- nlrob(form, data = DNase1, method = "CM",
	       lower = setNames(c(0,0,0,0), psNms), upper = 3, trace = TRUE)
 gmtl <- nlrob(form, data = DNase1, method = "mtl",
	       lower = setNames(c(0,0,0,0), psNms), upper = 3, trace = TRUE)
 stopifnot(identical(sapply(list(gMM, gCM, gmtl), estimethod),
                     c("MM", "CM", "mtl")))
}
## End(Don't show)



