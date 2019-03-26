library(mrbsizeR)


### Name: plot.CImapSphere
### Title: Plotting of simultaneous credible intervals on a sphere.
### Aliases: plot.CImapSphere

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

# Credibility analysis using simultaneous credible intervals
plot(x = mrbOut$ciout, lon = lon, lat = lat)




