library(iMRMC)


### Name: sim.gRoeMetz.config
### Title: Create a configuration object for the sim.gRoeMetz program
### Aliases: sim.gRoeMetz.config

### ** Examples

# Create a sample configuration object
config <- sim.gRoeMetz.config()
# Simulate an MRMC ROC data set
dFrame.imrmc <- sim.gRoeMetz(config)
# Analyze the MRMC ROC data
result <- doIMRMC(dFrame.imrmc)



