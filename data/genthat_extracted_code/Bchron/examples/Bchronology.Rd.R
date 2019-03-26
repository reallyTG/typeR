library(Bchron)


### Name: Bchronology
### Title: Runs the Compound Poisson-Gamma chronology model of Haslett and
###   Parnell (2008)
### Aliases: Bchronology

### ** Examples

## No test: 
# Data from Glendalough
data(Glendalough)

# Run in Bchronology - all but first age uses intcal13
GlenOut = Bchronology(ages=Glendalough$ages,ageSds=Glendalough$ageSds,
                      calCurves=Glendalough$calCurves,positions=Glendalough$position,
                      positionThicknesses=Glendalough$thickness,ids=Glendalough$id,
                      predictPositions=seq(0,1500,by=10))

# Summarise it a few different ways
summary(GlenOut) # Default is for quantiles of ages at predictPosition values
summary(GlenOut, type='convergence') # Check model convergence
summary(GlenOut, type='outliers') # Look at outlier probabilities

# Predict for some new positions
predictAges = predict(GlenOut, newPositions = c(150,725,1500), newPositionThicknesses=c(5,0,20))

# Plot the output
plot(GlenOut,main="Glendalough",xlab='Age (cal years BP)',ylab='Depth (cm)',las=1)
## End(No test)




