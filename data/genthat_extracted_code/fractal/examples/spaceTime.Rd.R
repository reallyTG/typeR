library(fractal)


### Name: spaceTime
### Title: Space time separation plot
### Aliases: spaceTime as.matrix.spaceTime eda.plot.spaceTime
###   plot.spaceTime print.spaceTime
### Keywords: univar models nonlinear

### ** Examples

## Using the beamchaos data calculate the space 
## time separation contours for probabilities 
## 1/10, 2/10, ..., 1, for a 3-dimensional 
## delay embedding with delay of 10. Plot the 
## resulting contours, which will reveal 
## periodicity in the data. From the top 
## contour in the plot, which corresponds to 
## probability 1, we can conclude that any two 
## vectors in the chosen delay embedding which 
## are separated in time by approximately 90 
## time steps are separated by a distance of at 
## least 8 in the phase space. 
z <- spaceTime(beamchaos, dim=3, tlag=10,
    olag.max=500, probability=1/10)

## print the results 
print(z)

## plot the results 
plot(z)

## extended data analysis plot 
eda.plot(z)



