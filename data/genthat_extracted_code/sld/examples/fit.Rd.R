library(sld)


### Name: fit.sld.lmom
### Title: Fit the skew logistic distribution using L-Moments
### Aliases: fit.sld.lmom.given fit.sld.lmom
### Keywords: estimation

### ** Examples

generated.data <- rsl(300,c(0,1,.4))
estimate1 <- fit.sld.lmom(generated.data)
estimate2 <- fit.sld.lmom.given(c(0,1,.3),n=300)
data(PCB1)
hist(PCB1,prob=TRUE,main="PCB in Pelican Egg Yolk with SLD fit")
fit.pcb <- fit.sld.lmom(PCB1)
print(fit.pcb)
plotsld(fit.pcb[,1],add=TRUE,col="blue")



