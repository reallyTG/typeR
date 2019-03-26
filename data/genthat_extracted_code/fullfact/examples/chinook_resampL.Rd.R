library(fullfact)


### Name: chinook_resampL
### Title: Chinook salmon length, bootstrap resampled
### Aliases: chinook_resampL
### Keywords: datasets

### ** Examples

data(chinook_resampL)
#the five models
length_rcomp1<- resampLmer(resamp=chinook_resampL,dam="dam",sire="sire",response="length",
start=1,end=5)  #full analysis should use 1,000 models



