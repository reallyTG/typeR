library(smbinning)


### Name: smbinning.factor
### Title: Binning on Factor Variables
### Aliases: smbinning.factor

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Binning a factor variable
result=smbinning.factor(smbsimdf1,x="inc",y="fgood", maxcat=11)
result$ivtable



