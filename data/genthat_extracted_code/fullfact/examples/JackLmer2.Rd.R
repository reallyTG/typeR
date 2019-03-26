library(fullfact)


### Name: JackLmer2
### Title: Jackknife components for normal data 2
### Aliases: JackLmer2

### ** Examples

data(chinook_length) #Chinook salmon offspring length

#Delete-one
#length_jack2<- JackLmer2(observ=chinook_length,dam="dam",sire="sire",response="length",
#position="tray")
length_jack2<- JackLmer2(observ=chinook_length,dam="dam",sire="sire",response="length",
position="tray",first=2) #first 2

#Delete-d, d=5
#length_jack2.2<- JackLmer2(observ=chinook_length,dam="dam",sire="sire",response="length",
#position="tray",size=5)
length_jack2.2<- JackLmer2(observ=chinook_length,dam="dam",sire="sire",response="length",
position="tray",size=5,first=2) #first 2



