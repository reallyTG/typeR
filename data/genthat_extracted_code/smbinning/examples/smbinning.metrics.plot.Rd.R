library(smbinning)


### Name: smbinning.metrics.plot
### Title: Visualization of a Classification Matrix
### Aliases: smbinning.metrics.plot

### ** Examples

# Load library and its dataset
library(smbinning)
smbmetricsdf=smbinning.metrics(dataset=smbsimdf1, prediction="cbs1",
                               actualclass="fgood", returndf=1)

# Example 1: Plots based on optimal cutoff
smbinning.metrics.plot(df=smbmetricsdf,plot='cmactual')

# Example 2: Plots using user defined cutoff
smbinning.metrics.plot(df=smbmetricsdf,cutoff=600,plot='cmactual')
smbinning.metrics.plot(df=smbmetricsdf,cutoff=600,plot='cmactualrates')
smbinning.metrics.plot(df=smbmetricsdf,cutoff=600,plot='cmmodel')
smbinning.metrics.plot(df=smbmetricsdf,cutoff=600,plot='cmmodelrates')



