library(fullfact)


### Name: JackLmer
### Title: Jackknife components for normal data
### Aliases: JackLmer

### ** Examples

data(chinook_length) #Chinook salmon offspring length

#Delete-one
#length_jack1<- JackLmer(observ=chinook_length,dam="dam",sire="sire",response="length")
length_jack1<- JackLmer(observ=chinook_length,dam="dam",sire="sire",response="length",
first=2) #first 2

#Delete-d, d=5
#length_jack1.2<- JackLmer(observ=chinook_length,dam="dam",sire="sire",response="length",
#size=5)
length_jack1.2<- JackLmer(observ=chinook_length,dam="dam",sire="sire",response="length",
size=5,first=2) #first 2



