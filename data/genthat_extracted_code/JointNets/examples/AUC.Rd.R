library(JointNets)


### Name: AUC
### Title: return AUC score for JointNets method
### Aliases: AUC

### ** Examples

simulationresult = simulation(n=c(100,100,100))
AUC_result = AUC(simulationresult,lambdas = seq(0.1,2,0.5),epsilon = 2)
AUC_result
graphics.off()
par(ask = FALSE)
par(mfrow = c(1, 1))
plot(AUC_result$fPM,AUC_result$tPM)



