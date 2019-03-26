library(surveillance)


### Name: plot.disProg
### Title: Plot Generation of the Observed and the Defined Outbreak States
###   of a (Multivariate) Time Series
### Aliases: plot.disProg plot.disProg.one
### Keywords: hplot

### ** Examples

# Plotting of simulated data
disProgObj <- sim.pointSource(p = 0.99, r = 0.5, length = 208,
                              A = 1, alpha = 1, beta = 0, phi = 0,
                              frequency = 1, state = NULL, K = 5)
# plot the simulated disease with the defined outbreaks
plot(disProgObj)
title <- "Number of Infected and Defined Outbreak Positions for Simulated Data"
plot(disProgObj, title = title)
plot(disProgObj, title = title, xaxis.years=TRUE,
     startyear = 1999, firstweek = 13)
plot(disProgObj, title = title, xaxis.years=TRUE,
     startyear = 1999, firstweek = 14)

# Plotting of measles data
data(measles.weser)
# one plot
plot(measles.weser, title = "measles cases in the district Weser-Ems",
     xaxis.years=TRUE, startyear= 2001, firstweek=1)
# plot cases for each "Kreis" 
plot(measles.weser, same.scale=TRUE, as.one=FALSE)



