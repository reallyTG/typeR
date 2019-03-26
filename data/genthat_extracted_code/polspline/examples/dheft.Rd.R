library(polspline)


### Name: dheft
### Title: Heft: hazard estimation with flexible tails
### Aliases: dheft hheft pheft qheft rheft
### Keywords: distribution smooth survival

### ** Examples

fit <- heft(testhare[,1],testhare[,2])
dheft(0:10,fit)
hheft(0:10,fit)
pheft(0:10,fit)
qheft((1:19)/20,fit)
rheft(10,fit)



