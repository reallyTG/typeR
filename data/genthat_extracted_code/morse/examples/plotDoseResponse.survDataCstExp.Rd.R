library(morse)


### Name: plotDoseResponse.survDataCstExp
### Title: Plot dose-response from 'survData' objects
### Aliases: plotDoseResponse.survDataCstExp
### Keywords: plot

### ** Examples


library(ggplot2)

# (1) Load the data
data(zinc)

# (2) Create an object of class 'survData'
zinc <- survData(zinc)

# (3) Plot dose-response
plotDoseResponse(zinc)

# (4) Plot dose-respo nse with a generic style
plotDoseResponse(zinc, style = "generic")




