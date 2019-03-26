library(fractal)


### Name: corrDim
### Title: Correlation dimension
### Aliases: corrDim
### Keywords: univar models nonlinear

### ** Examples

## calculate the correlation dimension estimates 
## for chaotic beam data using a delay 
## embedding for dimensions 1 through 10, a 
## orbital lag of 10, and a spatial resolution 
## of 4. 
beam.d2 <- corrDim(beamchaos, olag=10, dim=10, res=4)

## print a summary of the results 
print(beam.d2)

## plot the correlation summation curves 
plot(beam.d2, fit=FALSE, legend=FALSE)

## plot an extended data analysis plot 
eda.plot(beam.d2)



