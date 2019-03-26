library(Evomorph)


### Name: SimEvo
### Title: Simulation of Shape Variation
### Aliases: SimEvo

### ** Examples
 
data("aegla_landmarks")

#Use GpaResiduals function to obtain GPA residual matrix and consensus
# coordinates from landmark configuration

a_data=GpaResiduals(aegla_landmarks)

#Simulate morphological evolution with a variation rate "vari"
# trough "ngen" generations and retrieve the last generation shape coordinates

simshape = SimEvo(vari = 2, consensusvec = a_data$cvectorized, 
resids = a_data$resid, ngen = 10000, fsamp = 10000)

#Plot consensus shape and the simulated shape

par(mfrow=c(1, 2))
plot(a_data$consens,type = "p",main = "Reference", xlab = "", ylab = "")
plot(simshape[[1]],type = "p",col = "red",main = "Target", xlab = "", ylab = "")

#Or you can use PlotVariations to see the difference more clearly

PlotVariations(simshape,a_data$consens)




