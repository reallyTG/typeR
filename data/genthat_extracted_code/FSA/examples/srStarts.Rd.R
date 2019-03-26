library(FSA)


### Name: srStarts
### Title: Finds reasonable starting values for parameters in specific
###   parameterizations of common stock-recruitment models.
### Aliases: srStarts
### Keywords: manip

### ** Examples

## Simple Examples
srStarts(recruits~stock,data=CodNorwegian)
srStarts(recruits~stock,data=CodNorwegian,param=2)
srStarts(recruits~stock,data=CodNorwegian,param=3)
srStarts(recruits~stock,data=CodNorwegian,param=4)
srStarts(recruits~stock,data=CodNorwegian,type="Ricker")
srStarts(recruits~stock,data=CodNorwegian,type="Ricker",param=2)
srStarts(recruits~stock,data=CodNorwegian,type="Ricker",param=3)
srStarts(recruits~stock,data=CodNorwegian,type="Shepherd")
srStarts(recruits~stock,data=CodNorwegian,type="SailaLorda")
srStarts(recruits~stock,data=CodNorwegian,type="independence")

## Simple Examples with a Plot
srStarts(recruits~stock,data=CodNorwegian,type="Ricker",plot=TRUE)
srStarts(recruits~stock,data=CodNorwegian,type="BevertonHolt",plot=TRUE)
srStarts(recruits~stock,data=CodNorwegian,type="Shepherd",plot=TRUE)
srStarts(recruits~stock,data=CodNorwegian,type="SailaLorda",plot=TRUE)
srStarts(recruits~stock,data=CodNorwegian,type="independence",plot=TRUE)

## See examples in srFuns() for use of srStarts() when fitting stock-recruit models




