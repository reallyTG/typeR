library(netSEM)


### Name: plot.netSEM
### Title: Plotting of netSEM diagram
### Aliases: plot.netSEM

### ** Examples

# Load acrylic data set
data(acrylic)
# Build a semi-gSEM model
ans <- netSEMm(acrylic)
# Subset dataset with three cutoff
res <- subsetData(ans,cutoff=c(0.3,0.6,0.8))
# Plot the network model 
plot(ans,res)
# plot the network diagram and save as 'semplot.png' file
#plot(ans,res,plot.save=TRUE,filename=c("semplot"))





