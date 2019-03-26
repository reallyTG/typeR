library(fullfact)


### Name: observLmer2
### Title: Variance components for normal data 2
### Aliases: observLmer2

### ** Examples

data(chinook_length) #Chinook salmon offspring length
length_mod2<- observLmer2(observ=chinook_length,dam="dam",sire="sire",response="length",
position="tray")
length_mod2



