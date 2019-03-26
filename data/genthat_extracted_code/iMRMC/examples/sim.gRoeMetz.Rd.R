library(iMRMC)


### Name: sim.gRoeMetz
### Title: Simulate an MRMC data set of an ROC experiment comparing two
###   modalities
### Aliases: sim.gRoeMetz

### ** Examples

# Create a sample configuration object
config <- sim.gRoeMetz.config()
# Simulate an MRMC ROC data set
dFrame.imrmc <- sim.gRoeMetz(config)
# Analyze the MRMC ROC data
result <- doIMRMC(dFrame.imrmc)




