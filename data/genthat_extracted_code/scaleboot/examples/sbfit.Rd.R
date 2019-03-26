library(scaleboot)


### Name: sbfit
### Title: Fitting Models to Bootstrap Probabilities
### Aliases: sbfit sbfit.scaleboot sbfit.scalebootv sbfit.default
###   sbfit.matrix sbfit.data.frame print.scaleboot print.scalebootv
### Keywords: models nonparametric

### ** Examples

## Testing a hypothesis
## Examples of fitting models to a vector of bp's
## mam15.relltest$t4 of data(mam15), but
## using a different set of scales (sigma^2 values).
## In the below, sigma^2 ranges 0.01 to 100 in sa[i]
## This very large range is only for illustration.
## Typically, the range around 0.1 to 10
## is recommended for much better model fitting.
## In other examples, we have used
## sa = 9^seq(-1,1,length=13).

cnt <- c(0,0,0,0,6,220,1464,3565,5430,6477,6754,
         6687,5961) # observed frequencies at scales
nb <- 100000 # number of replicates at each scale
bp <- cnt/nb # bootstrap probabilities (bp's)
sa <- 10^seq(-2,2,length=13) # scales (sigma squared)
## model fitting to bp's 
f <- sbfit(bp,nb,sa) # model fitting ("scaleboot" object)
f # print the result of fitting
plot(f,legend="topleft") # observed bp's and fitted curves
## approximately unbiased p-values
summary(f) # calculate and print p-values
## refitting with models up to "poly.4" and "sing.4"
f <- sbfit(f,models=1:4)
f # print the result of fitting
plot(f,legend="topleft") # observed bp's and fitted curves
summary(f) # calculate and print p-values

## Not run: 
##D ## Testing multiple hypotheses (only two here)
##D ## Examples of fitting models to vectors of bp's
##D ## mam15.relltest[c("t1,t2")]
##D cnt1 <- c(85831,81087,76823,72706,67946,62685,57576,51682,
##D        45887,41028,35538,31232,27832)  # cnt for "t1"
##D cnt2 <- c(2,13,100,376,975,2145,3682,5337,7219,8559,
##D        10069,10910,11455)  # cnt for "t2"
##D cnts <- rbind(cnt1,cnt2)
##D nb <- 100000 # number of replicates at each scale
##D bps <- cnts/nb # row vectors are bp's
##D sa <- 9^seq(-1,1,length=13) # scales (sigma squared)
##D fv <- sbfit(bps,nb,sa) # returns a "scalebootv" object
##D fv # print the result of fitting
##D plot(fv) # multiple plots
##D summary(fv) # calculate and print p-values
## End(Not run)



