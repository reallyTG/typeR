library(fullfact)


### Name: JackLmer3
### Title: Jackknife components for normal data 3
### Aliases: JackLmer3

### ** Examples

data(chinook_length) #Chinook salmon offspring length

#Delete-one
#length_jack3<- JackLmer3(observ=chinook_length,dam="dam",sire="sire",response="length",
#remain="egg_size + (1|tray)")
length_jack3<- JackLmer3(observ=chinook_length,dam="dam",sire="sire",response="length",
remain="egg_size + (1|tray)",first=2) #first 2

#Delete-d, d=5
#length_jack3.2<- JackLmer3(observ=chinook_length,dam="dam",sire="sire",response="length",
#remain="egg_size + (1|tray)",size=5)
length_jack3.2<- JackLmer3(observ=chinook_length,dam="dam",sire="sire",response="length",
remain="egg_size + (1|tray)",size=5,first=2) #first 2



