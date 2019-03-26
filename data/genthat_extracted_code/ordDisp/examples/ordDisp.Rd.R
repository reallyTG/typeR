library(ordDisp)


### Name: ordDisp-class
### Title: Separating Location and Dispersion in Ordinal Regression Models
### Aliases: ordDisp ordDisp-class

### ** Examples

data(reti)

mod <- ordDisp(RET~SM+DIAB+GH+BP|SM+DIAB,data=reti,family="cumulative")
summary(mod)




