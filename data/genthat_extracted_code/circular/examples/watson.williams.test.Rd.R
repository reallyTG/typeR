library(circular)


### Name: watson.williams.test
### Title: Watson-Williams Test of Homogeneity of Means
### Aliases: watson.williams.test watson.williams.test.default
###   watson.williams.test.list watson.williams.test.formula
### Keywords: htest

### ** Examples


# Ant orientation from Duelli and Wehner (1973)
# Example used in Batschelet (1981)
data <- list(
  exp = circular(rep(c(-20, -10, 0), c(1,7,2)), 
        units="degrees", template="geographics"),
  control = circular(rep(c(-10, 0, 10, 20), c(3,3,3,1)), 
            units="degrees", template="geographics")
)

watson.williams.test(data)




