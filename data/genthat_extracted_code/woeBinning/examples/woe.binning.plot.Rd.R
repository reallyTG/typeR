library(woeBinning)


### Name: woe.binning.plot
### Title: Visualization of Binning
### Aliases: woe.binning.plot

### ** Examples

# Load German credit data
data(germancredit)
df <- germancredit

# Bin all variables of the data frame (apart from the target variable)
# with default parameter settings
binning <- woe.binning(df, 'creditability', df)

# Plot all binned variables as multiple plots
woe.binning.plot(binning)

# Plot only the first four binned variables with the highest IV value
# as multiple plots
woe.binning.plot(binning, plot.range='1:4')

# Plot the binned variables in single plots
woe.binning.plot(binning, multiple.plots=FALSE)




