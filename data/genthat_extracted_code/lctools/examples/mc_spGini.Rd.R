library(lctools)


### Name: mc.spGini
### Title: Monte Carlo simulation for the significance of the Spatial Gini
###   coefficient
### Aliases: mc.spGini
### Keywords: Monte Carlo Simulation Inference Spatial Gini Spatial
###   Inequality Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
Nsim=19
Bd1<-4
x1<-GR.Municipalities@data$Income01[1:45]
WType1<-'Binary'

SIM20<-mc.spGini(Nsim,Bd1,x1,GR.Municipalities@data$X[1:45], GR.Municipalities@data$Y[1:45],WType1)
SIM20

hist(SIM20$SIM$SIM.nsGini,col = "lightblue", main = "Observed and simulated nsGini",
xlab = "Simulated nsGini", ylab = "Frequency",xlim = c(min(SIM20$SIM$SIM.nsGini),
SIM20$spGini.Observed[[3]]))
abline(v=SIM20$spGini.Observed[[3]], col = 'red')



