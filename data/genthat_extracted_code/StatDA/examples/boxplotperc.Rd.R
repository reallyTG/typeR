library(StatDA)


### Name: boxplotperc
### Title: Boxplot based on percentiles
### Aliases: boxplotperc
### Keywords: univar

### ** Examples

data(chorizon)
Ba=chorizon[,"Ba"]
boxplotperc(Ba,quant=c(0.05,0.95),horizontal=TRUE,xlab="Ba [mg/kg]",cex.lab=1.2,pch=3)



