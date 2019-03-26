library(psych)


### Name: galton
### Title: Galton's Mid parent child height data
### Aliases: galton
### Keywords: datasets

### ** Examples

data(galton)
describe(galton)
 #show the scatter plot and the lowess fit 
pairs.panels(galton,main="Galton's Parent child heights")  
#but this makes the regression lines look the same
pairs.panels(galton,lm=TRUE,main="Galton's Parent child heights") 
 #better is to scale them 
pairs.panels(galton,lm=TRUE,xlim=c(62,74),ylim=c(62,74),main="Galton's Parent child heights") 



