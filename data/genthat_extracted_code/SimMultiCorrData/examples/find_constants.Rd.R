library(SimMultiCorrData)


### Name: find_constants
### Title: Find Power Method Transformation Constants
### Aliases: find_constants
### Keywords: Fleishman, Headrick constants,

### ** Examples


# Exponential Distribution
find_constants("Fleishman", 2, 6)

## Not run: 
##D # Compute third-order power method constants.
##D 
##D options(scipen = 999) # turn off scientific notation
##D 
##D # Laplace Distribution
##D find_constants("Fleishman", 0, 3)
##D 
##D # Compute fifth-order power method constants.
##D 
##D # Logistic Distribution
##D find_constants(method = "Polynomial", skews = 0, skurts = 6/5, fifths = 0,
##D                sixths = 48/7)
##D 
##D # with correction to sixth cumulant
##D find_constants(method = "Polynomial", skews = 0, skurts = 6/5, fifths = 0,
##D                sixths = 48/7, Six = seq(1.7, 2, by = 0.01))
##D 
## End(Not run)



