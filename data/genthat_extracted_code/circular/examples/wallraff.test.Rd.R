library(circular)


### Name: wallraff.test
### Title: Wallraff Test of Angular Distances
### Aliases: wallraff.test wallraff.test.default wallraff.test.list
###   wallraff.test.formula
### Keywords: htest

### ** Examples


# Homing of pigeons
# Example used in Batschelet (1981)
data <- list(
  control = circular(c(70, 80, 80, 85, 85, 90, 95, 95), 
        units="degrees", template="geographics"),
  experimental = circular(c(5, 5, 15, 55, 55, 65, 105, 120, 340), 
            units="degrees", template="geographics")
)

# compare the angular dispersion between the two groups
wallraff.test(data)

# compare the homing performance
# home azimuth is 40 degrees for both groups
wallraff.test(data, 
              ref = circular(c(40, 40), units="degrees",
                                 template="geographics")
             )
# we could have more simply used
wallraff.test(data, ref=40)
# because ref is automatically repeated and considered
# in the same circular reference as the data




