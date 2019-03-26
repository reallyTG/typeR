library(multimode)


### Name: acidity
### Title: Acid-neutralizing capacity
### Aliases: acidity
### Keywords: datasets

### ** Examples

data("acidity")
# Kernel density estimation with two modes and SiZer
locmodes(acidity,mod0=2,display=TRUE,xlab="log(ANC+50)")
sizer(acidity,bws=c(0.1,1),xlab="log(ANC+50)")



