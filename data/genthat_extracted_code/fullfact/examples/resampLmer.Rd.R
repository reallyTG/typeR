library(fullfact)


### Name: resampLmer
### Title: Bootstrap components for normal data
### Aliases: resampLmer

### ** Examples

data(chinook_resampL) #5 iterations

#length_rcomp1<- resampLmer(resamp=length_datR,dam="dam",sire="sire",response="length",
#start=1,end=1000)
length_rcomp1<- resampLmer(resamp=chinook_resampL,dam="dam",sire="sire",response="length",
start=1,end=5)



