library(mrbsizeR)


### Name: mrbsizeRsphere
### Title: Multiresolution analysis of random signals for spherical data.
### Aliases: mrbsizeRsphere

### ** Examples

# Artificial spherical sample data
set.seed(987)
sampleData <- matrix(stats::rnorm(2000), nrow = 200)
sampleData[50:65, ] <- sampleData[50:65, ] + 5

# mrbsizeRsphere analysis
mrbOut <- mrbsizeRsphere(posteriorFile = sampleData, mm = 10, nn = 20,  
                          lambdaSmoother = c(1, 1000), prob = 0.95)



