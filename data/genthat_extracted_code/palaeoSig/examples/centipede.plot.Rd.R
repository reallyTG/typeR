library(palaeoSig)


### Name: centipede.plot
### Title: Plots species optima and tolerances
### Aliases: centipede.plot
### Keywords: hplot

### ** Examples


require(rioja)
data(SWAP)
mod<-WA(SWAP$spec, SWAP$pH, tolDW=TRUE)
keep<-colSums(SWAP$spec)>40#only common taxa
opar<-par(no.readonly = TRUE)
par(mar=c(5.1,6.1,2.1,1.1))#extra space on left side of plot for names
centipede.plot(x=mod, keep=keep, pch=20, cex.axis=.7)
par(opar)




