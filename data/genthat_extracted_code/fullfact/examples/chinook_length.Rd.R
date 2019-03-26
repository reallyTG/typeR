library(fullfact)


### Name: chinook_length
### Title: Chinook salmon length, raw data
### Aliases: chinook_length
### Keywords: datasets

### ** Examples

data(chinook_length)
## Standard additive genetic, non-additive genetic, and maternal variance analysis
length_mod1<- observLmer(observ=chinook_length,dam="dam",sire="sire",response="length")
length_mod1



