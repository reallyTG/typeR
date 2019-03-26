library(morse)


### Name: plotDoseResponse.reproData
### Title: Plot dose-response from 'reproData' objects
### Aliases: plotDoseResponse.reproData
### Keywords: plot

### ** Examples

# (1) Load the data
data(zinc)

# (2) Create an object of class 'reproData'
zinc_rpr <- reproData(zinc)

# (3) Plot dose-response
plotDoseResponse(zinc_rpr)

# (4) Plot dose-response with a generic style
plotDoseResponse(zinc_rpr, style = "generic")




