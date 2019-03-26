library(epanetReader)


### Name: read.rpt
### Title: Read .rpt file
### Aliases: read.rpt

### ** Examples

# path to Net1.rpt example file included with this package
rpt <- file.path( find.package("epanetReader"), "extdata","Net1.rpt") 
n1r <- read.rpt(rpt)
summary(n1r)
names(n1r)

#Results for a chosen time period can be retrieved using the subset function.
subset(n1r$nodeResults, Timestamp == "0:00:00")

# time series plot for a nodal value
plot( Chlorine ~ timeInSeconds,  
      data = subset(n1r$nodeResults, ID == "22"))    

# Plotting the epanet.rpt object itself gives a map.
# Note that the object created from the .inp file is required.
inp <- file.path( find.package("epanetReader"), "extdata","Net1.inp") 
n1 <- read.inp(inp)
plot( n1r, n1)

# Energy Usage table
print(n1r$energyUsage)



