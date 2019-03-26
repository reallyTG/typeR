library(morse)


### Name: plot.reproData
### Title: Plotting method for 'reproData' objects
### Aliases: plot.reproData
### Keywords: plot

### ** Examples

# (1) Load the data
data(cadmium1)

# (2) Create an object of class 'reproData'
cadmium1 <- reproData(cadmium1)

# (3) Plot the reproduction data
plot(cadmium1)

# (4) Plot the reproduction data for a fixed concentration
plot(cadmium1, concentration = 4.36, style = "generic")




