library(iMRMC)


### Name: simMRMC
### Title: Simulate an MRMC data set
### Aliases: simMRMC

### ** Examples

# Create a sample configuration object
config <- sim.gRoeMetz.config()
# Simulate an MRMC ROC data set
dFrame.imrmc <- sim.gRoeMetz(config)
# Analyze the MRMC ROC data
result <- doIMRMC(dFrame.imrmc)



