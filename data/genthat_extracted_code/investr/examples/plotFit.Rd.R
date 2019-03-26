library(investr)


### Name: plotFit
### Title: Plotting Confidence/Prediction Bands
### Aliases: plotFit plotFit.glm plotFit.lm plotFit.lqs plotFit.nls
###   plotFit.rlm

### ** Examples

#
# A nonlinear regression example
#
data(Puromycin, package = "datasets")
Puromycin2 <- Puromycin[Puromycin$state == "treated", ][, 1:2]
Puro.nls <- nls(rate ~ Vm * conc/(K + conc), data = Puromycin2,
                start = c(Vm = 200, K = 0.05))
plotFit(Puro.nls, interval = "both", pch = 19, shade = TRUE, 
        col.conf = "skyblue4", col.pred = "lightskyblue2")  



