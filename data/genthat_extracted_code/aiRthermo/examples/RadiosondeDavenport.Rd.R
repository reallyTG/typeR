library(aiRthermo)


### Name: RadiosondeDavenport
### Title: Radiosonde Davenport
### Aliases: RadiosondeDavenport
### Keywords: Datasets

### ** Examples

data(RadiosondeDavenport)
#Calculate the pressure in Pa
RadiosondeDavenport$V1*100

#Calculate the temperature in K
C2K(RadiosondeDavenport$V3)



