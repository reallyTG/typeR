library(SetMethods)


### Name: property.cube
### Title: Function producing a 3D scatter plot.
### Aliases: property.cube

### ** Examples


# Load the Schneider data:

data(SCHF)

# Create a property space for conditions "EMP","BARGAIN", and outcome "EXPORT":

property.cube(SCHF[,c("EMP","BARGAIN","EXPORT")])

# Create a property space for conditions 1,2, and 3 in the data together with case labels:

property.cube(SCHF[,1:3], labs=TRUE)



