library(mrbsizeR)


### Name: plot.HPWmapGrid
### Title: Plotting of pointwise and highest pointwise probabilities.
### Aliases: plot.HPWmapGrid

### ** Examples

# Artificial sample data
set.seed(987)
sampleData <- matrix(stats::rnorm(100), nrow = 10)
sampleData[4:6, 6:8] <- sampleData[4:6, 6:8] + 5

# Generate samples from multivariate t-distribution
tSamp <- rmvtDCT(object = sampleData, lambda = 0.2, sigma = 6, nu0 = 15,
                   ns = 1000)  
 
# mrbsizeRgrid analysis
mrbOut <- mrbsizeRgrid(posteriorFile = tSamp$sample, mm = 10, nn = 10, 
                       lambdaSmoother = c(1, 1000), prob = 0.95)

# Posterior mean of the differences of smooths
plot(x = mrbOut$smMean, turnOut = TRUE)                    

# Credibility analysis using pointwise (PW) maps
plot(x = mrbOut$hpout, plotWhich = "PW", turnOut = TRUE)

# Credibility analysis using highest pointwise probability (HPW) maps
plot(x = mrbOut$hpout, plotWhich = "HPW", turnOut = TRUE)




