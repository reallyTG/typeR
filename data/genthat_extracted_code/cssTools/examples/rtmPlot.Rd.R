library(cssTools)


### Name: rtmPlot
### Title: Plots for the ROC Based Threshold Method for Estimating Networks
### Aliases: rtmPlot

### ** Examples

# Load the highTechManagers data given in cssTools package
data(highTechManagers)

# There are 21 CSS slices in the complete data 
# Suppose we only observed the 10 slices with the following indexes
sampled=c(2,4,5,8,9,10,11,14,18,19)

# Then the observed data is the following
dSampled=highTechManagers[,,sampled]

# Apply the ROC based threshold method to estimate the network
y=rtm(dSampled,sampled)

# Now plot the ROC curve and the error types for various threshold values
rtmPlot(y)



