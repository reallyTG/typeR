library(BMT)


### Name: BMTchangepars
### Title: The BMT Distribution Parameter Conversion.
### Aliases: BMTchangepars

### ** Examples

# BMT on [0,1] with left tail weight equal to 0.25 and 
# right tail weight equal to 0.75
parameters <- BMTchangepars(0.25, 0.75, "t w")
parameters # Parameters of the BMT in the asymmetry-steepness parametrization

# BMT with mean equal to 0, standard deviation equal to 1, 
# asymmetry coefficient equal to 0.5 and 
# steepness coefficient equal to 0.75
parameters <- BMTchangepars(0.5, 0.5, "a-s", 0, 1, "l-s")
parameters # Parameters of the BMT in the tail weight and domain parametrization



