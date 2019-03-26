library(fullfact)


### Name: resampLmer3
### Title: Bootstrap components for normal data 3
### Aliases: resampLmer3

### ** Examples

data(chinook_resampL)

#length_rcomp3<- resampLmer3(resamp=length_datR,dam="dam",sire="sire",response="length",
#start=1,end=1000,remain="egg_size# + (1|tray#)")
length_rcomp3<- resampLmer3(resamp=chinook_resampL,dam="dam",sire="sire",response="length",
start=1,end=5,remain="egg_size# + (1|tray#)")



