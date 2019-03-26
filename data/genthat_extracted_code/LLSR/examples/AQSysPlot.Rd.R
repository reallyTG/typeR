library(LLSR)


### Name: AQSysPlot
### Title: AQSysPlot
### Aliases: AQSysPlot

### ** Examples

# Populating variable dataSET with binodal data
dataSET <- peg4kslt[ , 1:2]
# Fitting dataSET using Merchuk's function
data <- AQSys.data(dataSET, Order = "xy")
AQSysPlot(data)



