library(gstat)


### Name: sic2004
### Title: Spatial Interpolation Comparison 2004 data set: Natural Ambient
###   Radioactivity
### Aliases: sic2004 sic.train sic.pred sic.grid sic.test sic.val
### Keywords: datasets

### ** Examples

data(sic2004) 
# FIGURE 1. Locations of the 200 monitoring stations for the 11 data sets. 
# The values taken by the variable are known.
plot(y~x,sic.train,pch=1,col="red", asp=1)

# FIGURE 2. Locations of the 808 remaining monitoring stations at which 
# the values of the variable must be estimated.
plot(y~x,sic.pred,pch="?", asp=1, cex=.8) # Figure 2

# FIGURE 3. Locations of the 1008 monitoring stations (exhaustive data sets). 
# Red circles are used to estimate values located at the questions marks
plot(y~x,sic.train,pch=1,col="red", asp=1)
points(y~x, sic.pred, pch="?", cex=.8)




