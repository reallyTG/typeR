library(agricolae)


### Name: AMMI.contour
### Title: AMMI contour
### Aliases: AMMI.contour
### Keywords: aplot

### ** Examples

library(agricolae)
# see AMMI.
data(sinRepAmmi)
Environment <- sinRepAmmi$ENV
Genotype <- sinRepAmmi$GEN
Yield <- sinRepAmmi$YLD
REP <- 3
MSerror <- 93.24224
model<-AMMI(Environment, Genotype, REP, Yield, MSerror)
plot(model)
AMMI.contour(model,distance=0.7,shape=8,col="red",lwd=2,lty=5)



