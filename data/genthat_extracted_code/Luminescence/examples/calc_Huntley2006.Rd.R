library(Luminescence)


### Name: calc_Huntley2006
### Title: Apply the Huntley (2006) model
### Aliases: calc_Huntley2006
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
kars <- calc_Huntley2006(data = data,
                         rhop = rhop,
                         ddot = ddot,
                         readerDdot = readerDdot,
                         n.MC = 25)


## Not run: 
##D # You can also provide LnTn values separately via the 'LnTn' argument.
##D # Note, however, that the data frame for 'data' must then NOT contain
##D # a LnTn value. See argument descriptions!
##D LnTn <- data.frame(LnTn = c(1.84833, 2.24833),
##D                    LnTn.error = c(0.17, 0.22))
##D 
##D LxTx <- data[2:nrow(data), ]
##D 
##D kars <- calc_Huntley2006(data = LxTx,
##D                       LnTn = LnTn,
##D                       rhop = rhop,
##D                       ddot = ddot,
##D                       readerDdot = readerDdot,
##D                       n.MC = 25)
## End(Not run)



