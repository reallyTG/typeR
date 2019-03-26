library(oce)


### Name: handleFlags,section-method
### Title: Handle flags in Section Objects
### Aliases: handleFlags,section-method

### ** Examples

library(oce)
data(section)
section2 <- handleFlags(section, flags=c(1,3:9))
par(mfrow=c(2, 1))
plotTS(section)
plotTS(section2)




