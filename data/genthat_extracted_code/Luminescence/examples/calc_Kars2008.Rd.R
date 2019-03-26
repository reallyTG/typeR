library(Luminescence)


### Name: calc_Kars2008
### Title: Apply the Kars et al. (2008) model (deprecated)
### Aliases: calc_Kars2008
### Keywords: datagen

### ** Examples


## Load example data (sample UNIL/NB123, see ?ExampleData.Fading)
data("ExampleData.Fading", envir = environment())

## (1) Set all relevant parameters
# a. fading measurement data (IR50)
fading_data <- ExampleData.Fading$fading.data$IR50

# b. Dose response curve data
data <- ExampleData.Fading$equivalentDose.data$IR50

## (2) Define required function parameters
ddot <- c(7.00, 0.004)
readerDdot <- c(0.134, 0.0067)

# Analyse fading measurement and get an estimate of rho'.
# Note that the RLum.Results object can be directly used for further processing.
# The number of MC runs is reduced for this example
rhop <- analyse_FadingMeasurement(fading_data, plot = TRUE, verbose = FALSE, n.MC = 10)

## (3) Apply the Kars et al. (2008) model to the data
kars <- suppressWarnings(
  calc_Kars2008(data = data,
                rhop = rhop,
                ddot = ddot,
                readerDdot = readerDdot,
                n.MC = 25)
)




