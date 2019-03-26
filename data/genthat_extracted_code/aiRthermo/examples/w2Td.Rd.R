library(aiRthermo)


### Name: w2Td
### Title: Dew point temperature from mixing ratio
### Aliases: w2Td
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dws<-RadiosondeD[,6]/1000
w2Td(dPs,dws)



