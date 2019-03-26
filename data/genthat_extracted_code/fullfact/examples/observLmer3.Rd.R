library(fullfact)


### Name: observLmer3
### Title: Variance components for normal data 3
### Aliases: observLmer3

### ** Examples

data(chinook_length) #Chinook salmon offspring length
#just a few iterations for the p-value of fixed effect
length_mod3<- observLmer3(observ=chinook_length,dam="dam",sire="sire",response="length",
remain="egg_size + (1|tray)",iter=5)
length_mod3



