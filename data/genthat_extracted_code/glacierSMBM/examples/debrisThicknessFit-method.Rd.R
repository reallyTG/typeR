library(glacierSMBM)


### Name: debrisThicknessFit-method
### Title: Method: Debris thickness fitting function
### Aliases: debrisThicknessFit-method
###   debrisThicknessFit,numeric,numeric-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided data set as exemplary input for the function
# The values of the data set do not represent real field
# measurements and were only created for demonstration purposes
data(debrisThickness_measured, lst_measured,
    package = "glacierSMBM")
# Individual data sets should be loaded using the
# functions read.*()

# Calculate the required fitting parameters for the function
# debrisThicknessEmp() and plot the results
output <- debrisThicknessFit(surfaceTemperature = lst_measured,
    debrisThickness = debrisThickness_measured, plotOutput = TRUE)



