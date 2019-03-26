library(iMRMC)


### Name: doIMRMC
### Title: MRMC analysis of the area under the ROC curve
### Aliases: doIMRMC

### ** Examples

# Create a sample configuration file
config <- sim.gRoeMetz.config()
# Simulate an MRMC ROC data set
dFrame.imrmc <- sim.gRoeMetz(config)
# Analyze the MRMC ROC data
result <- doIMRMC(dFrame.imrmc)





