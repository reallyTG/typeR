library(robustbase)


### Name: adjOutlyingness
### Title: Compute (Skewness-adjusted) Multivariate Outlyingness
### Aliases: adjOutlyingness
### Keywords: robust multivariate

### ** Examples

## An Example with bad condition number and "border case" outliers

dim(longley)
set.seed(1) ## result is random!
ao1 <- adjOutlyingness(longley)
## which are outlying ?
which(!ao1$nonOut) ## one: "1948" - for this seed! (often: none)
stopifnot(all(ao1$nonOut[-2]))

## An Example with outliers :

dim(hbk)
set.seed(1)
ao.hbk <- adjOutlyingness(hbk)
str(ao.hbk)
hist(ao.hbk $adjout)## really two groups
table(ao.hbk$nonOut)## 14 outliers, 61 non-outliers:
## outliers are :
which(! ao.hbk$nonOut) # 1 .. 14   --- but not for all random seeds!

## here, they are the same as found by (much faster) MCD:
cc <- covMcd(hbk)
stopifnot(all(cc$mcd.wt == ao.hbk$nonOut))

## This is revealing: About 1--2 cases, where outliers are *not* == 1:14
##  but needs almost 1 [sec] per call:
if(interactive()) {
  for(i in 1:30) {
    print(system.time(ao.hbk <- adjOutlyingness(hbk)))
    if(!identical(iout <- which(!ao.hbk$nonOut), 1:14)) {
	 cat("Outliers:\n"); print(iout)
    }
  }
}

## "Central" outlyingness: *not* calling mc()  anymore, since 2014-12-11:
trace(mc)
out <- capture.output(
  oo <- adjOutlyingness(hbk, clower=0, cupper=0)
)
untrace(mc)
stopifnot(length(out) == 0)

## A rank-deficient case
T <- tcrossprod(data.matrix(toxicity))
try(adjOutlyingness(T, maxit. = 20, trace.lev = 2)) # fails and recommends:
T. <- fullRank(T)
aT <- adjOutlyingness(T.)
plot(sort(aT$adjout, decreasing=TRUE), log="y")
plot(T.[,9:10], col = (1:2)[1 + (aT$adjout > 10000)])
## .. (not conclusive; directions are random, more 'ndir' makes a difference!)



