library(asbio)


### Name: paik
### Title: Paik diagrams
### Aliases: paik
### Keywords: graphs

### ** Examples

require(tcltk)

data(death.penalty)# from Agresti 2012 

op <- par(mfrow=c(1,2), mar=c(4,4,0,0))
paik(verdict ~ d.race + v.race, counts = count, data = death.penalty, 
leg.title = "Victims race", xlab = "Defendants race", 
ylab = "Proportion receiving death penalty")
par(mar=c(4,2,0,2))
paik(verdict ~ v.race + d.race, counts = count, data = death.penalty, 
xlab = "Victims race", leg.title = "Defendants race",leg.loc="topleft", 
ylab = "", yaxt = "n")

message("Type: vignette(\"simpson\") for more information about this figure")
par(op)



