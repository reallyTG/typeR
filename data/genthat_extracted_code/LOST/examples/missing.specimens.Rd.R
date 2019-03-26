library(LOST)


### Name: missing.specimens
### Title: Simulate incomplete specimens
### Aliases: missing.specimens

### ** Examples

data(dacrya)

#### remove 1 to 6 landmarks from 10 specimens
dac.miss<-missing.specimens(dacrya,10,c(1,2,3,4,5,6),16)
dac.miss



