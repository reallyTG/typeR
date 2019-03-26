library(geoscale)


### Name: geoscale-package
### Title: Geological Time Scale Plotting
### Aliases: geoscale-package geoscale
### Keywords: time-series,plot

### ** Examples

data(traits)
attach(traits)

geoscalePlot(age,trait,boxes="Age",ts.col=TRUE,scale="Period",type="l")
    


