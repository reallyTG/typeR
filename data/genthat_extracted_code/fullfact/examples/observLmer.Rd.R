library(fullfact)


### Name: observLmer
### Title: Variance components for normal data
### Aliases: observLmer

### ** Examples

data(chinook_length) #Chinook salmon offspring length
length_mod1<- observLmer(observ=chinook_length,dam="dam",sire="sire",response="length")
length_mod1



