library(BCE)


### Name: bce1
### Title: Bayesian Composition Estimator
### Aliases: bce1 bce
### Keywords: models

### ** Examples

##====================================

# example using bceInput data
# !!! should be weighted to correspond better to example of BCE!!!
A <- t(bceInput$Rat)
B <- t(bceInput$Dat)


result <- bce1(A,B,niter=1000)

## the number of accepted runs is zero;
## try different starting values

result <- bce1(A,B,niter=1000,initX=matrix(1/ncol(A),ncol(A),ncol(B)))

## number of accepted runs is still low;
## smaller jumps

result <- bce1(A,B,niter=1000,initX=matrix(1/ncol(A),ncol(A),ncol(B)),jmpA=.01,jmpX=.01)
Sum <-summary(result)

## did the algorithm converge?
plot(result$SS,type="l")
## no


## more runs, using the output of previous run as input.
result <- bce1(A,B,niter=1e4,jmpA=.01,jmpX=.01,updatecov=1e3,
               initX=Sum$lastX,initA=Sum$lastA,
               jmpCovar=Sum$covar*2.4^2/ncol(result$pars),
               )
Sum <-summary(result)

## we inspect the output:
plot(result$SS,type="l")
plot(result,ask=TRUE)
## looks already pretty good; to get a better result, repeat one more
## time with a  longer run. Uncomment the following paragraph and run.
## go get some coffee, this might take a while (~30s).

## result <- bce1(A,B,niter=1e5,jmpA=.01,jmpX=.01,updatecov=1e3,
##                outputlength=1e3,burninlength=.35e5,
##                initX=Sum$lastX,initA=Sum$lastA,
##                jmpCovar=Sum$covar*2.4^2/ncol(result$pars),
##                )
## Sum <-summary(result)
## plot(result$SS,type="l")
## plot(result,ask=TRUE)

# show results as mean with ranges
print(Sum$meanX)

# plot estimated means and ranges (lbX=lower, ubX=upper bound)
xlim <- range(c(Sum$lbX,Sum$ubX))

# first the mean
dotchart(x=t(Sum$meanX),xlim=xlim,                                                          
         main="Taxonomic composition",
         sub="using bce",pch=16)

# then ranges
nr <- nrow(Sum$meanX)
nc <- ncol(Sum$meanX)

for (i in 1:nr) 
  {ip <-(nr-i)*(nc+2)+1
   cc <- ip : (ip+nc-1)
   segments(t(Sum$lbX[i,]),cc,t(Sum$ubX[i,]),cc)
  }




