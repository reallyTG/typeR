library(fullfact)


### Name: fullfact-package
### Title: Full Factorial Breeding Analysis
### Aliases: fullfact-package fullfact
### Keywords: package

### ** Examples

data(chinook_length) #Chinook salmon offspring length

## Standard additive genetic, non-additive genetic, and maternal variance analysis

length_mod1<- observLmer(observ=chinook_length,dam="dam",sire="sire",response="length")
length_mod1

## Confidence intervals

##Bootstrap resampling of data: replicates within family
## Not run: 
##D resampRepli(dat=chinook_length,copy=c(3:8),family="family",replicate="repli",
##D iter=1000)
## End(Not run)
#saves the files in working directory: one for each replicate and
#one final (combined) file "resamp_datR.csv"

##Import file
#length_datR<- read.csv("resamp_datR.csv")
data(chinook_resampL) #same as length_datR, 5 iterations

##Models for the resampled data: standard analysis
## Not run: 
##D length_rcomp<- resampLmer(resamp=length_datR,dam="dam",sire="sire",
##D response="length",start=1,end=1000)
## End(Not run)

## 1. Uncorrected Bootstrap 95% confidence interval

#ciMANA(comp=length_rcomp)
data(chinook_bootL)  #similar to length_rcomp, but 1,000 models
ciMANA(comp=chinook_bootL)

## 2. Bias and accelerated corrected Bootstrap 95% confidence interval

##Jackknife resampling of data, delete-one: for acceleration estimate
## Not run: 
##D length_jack<- JackLmer(observ=chinook_length,dam="dam",sire="sire",
##D response="length")
## End(Not run)

#ciMANA(comp=length_rcomp,bias=c(0.0000000,0.7192253,0.2029684),accel=length_jack)
data(chinook_jackL)  #similar to length_jack, but all observations
ciMANA(comp=chinook_bootL,bias=c(0.0000000,0.7192253,0.2029684),accel=chinook_jackL)

##3. Jackknife 95% confidence interval

#ciJack(comp=length_jack,full=c(0.0000000,0.7192253,0.2029684,1.0404425))
ciJack(comp=chinook_jackL,full=c(0.0000000,0.7192253,0.2029684,1.0404425))



