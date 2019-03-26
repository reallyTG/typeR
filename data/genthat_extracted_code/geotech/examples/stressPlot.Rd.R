library(geotech)


### Name: stressPlot
### Title: Plot of Stress Profile
### Aliases: stressPlot sigmaX.plot sigmaZ.plot

### ** Examples


##  Example code for vertical stress plot
temp <- sigmaZ.profile(gamma = rep(100, 3), depth = c(10, 20, 30),
                       zw = 10, metric = FALSE)
depth <- temp$depth
sigmaTotal <- temp$sigmaZ.total
u <- temp$u
sigmaEff <- temp$sigmaZ.eff
sigmaZ.plot(depth = depth, sigmaZ.eff = sigmaEff, metric = FALSE,
            sigmaZ.total = sigmaTotal, u = u)

##  Example code for horizontal stress plot
##  Site with constant unit weight = 100 pcf, GWT at 10 ft depth
temp <- sigmaX.profile(gamma = rep(100, 3), depth = c(10, 20, 30),
                       K = c(0.35, 0.30, 0.28), zw = 10, metric = FALSE)
depth <- temp$depth
sigmaTotal <- temp$sigmaX.total
u <- temp$u
sigmaEff <- temp$sigmaX.eff
sigmaX.plot(depth = depth, sigmaX.eff = sigmaEff, metric = FALSE,
            sigmaX.total = sigmaTotal, u = u)



