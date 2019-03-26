library(cwm)


### Name: cwm-package
### Title: The package performs cluster weighed modelling assuming normal
###   distribution
### Aliases: cwm-package cwm
### Keywords: package

### ** Examples

library(MASS)
data(geyser)
x=geyser[,1]
y=geyser[,2]                            
cwmExample=cwrEm(x,y,nc=2)
print(cwmExample) 



