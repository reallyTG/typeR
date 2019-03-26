library(LLSR)


### Name: AQSys.data
### Title: Dataset and Fitted Function plot
### Aliases: AQSys.data

### ** Examples

# Populating variable dataSET with binodal data
dataSET <- peg4kslt[ , 1:2]
# Fitting dataSET using Merchuk's function
data <- AQSys.data(dataSET, Order = "xy")



