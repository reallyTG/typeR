library(mrbsizeR)


### Name: plot.HPWmapSphere
### Title: Plotting of pointwise and highest pointwise probabilities on a
###   sphere.
### Aliases: plot.HPWmapSphere

### ** Examples

# Artificial spherical sample data
set.seed(987)
sampleData <- matrix(stats::rnorm(2000), nrow = 200)
sampleData[50:65, ] <- sampleData[50:65, ] + 5
lon <- seq(-180, 180, length.out = 20)
lat <- seq(-90, 90, length.out = 10)

# mrbsizeRsphere analysis
mrbOut <- mrbsizeRsphere(posteriorFile = sampleData, mm = 20, nn = 10, 
                         lambdaSmoother = c(0.1, 1), prob = 0.95)
                           
# Posterior mean of the differences of smooths
plot(x = mrbOut$smMean, lon = lon, lat = lat,
     color = fields::tim.colors()) 

# Credibility analysis using pointwise (PW) maps
plot(x = mrbOut$hpout, lon = lon, lat = lat, plotWhich = "PW")

# Credibility analysis using highest pointwise probability (HPW) maps
plot(x = mrbOut$hpout, lon = lon, lat = lat, plotWhich = "HPW")




