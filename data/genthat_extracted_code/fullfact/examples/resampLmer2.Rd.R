library(fullfact)


### Name: resampLmer2
### Title: Bootstrap components for normal data 2
### Aliases: resampLmer2

### ** Examples

data(chinook_resampL) #5 iterations

#length_rcomp2<- resampLmer2(resamp=length_datR,dam="dam",sire="sire",response="length",
#start=1,end=1000,position="tray")
length_rcomp2<- resampLmer2(resamp=chinook_resampL,dam="dam",sire="sire",response="length",
start=1,end=5,position="tray")



