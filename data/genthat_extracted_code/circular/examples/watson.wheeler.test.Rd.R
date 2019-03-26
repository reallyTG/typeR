library(circular)


### Name: watson.wheeler.test
### Title: Watson-Williams Test of Homogeneity of Means
### Aliases: watson.wheeler.test watson.wheeler.test.default
###   watson.wheeler.test.list watson.wheeler.test.formula
### Keywords: htest

### ** Examples


# Example used in Zar (1999)
x1 <- circular(c(35, 45, 50, 55, 60, 70, 85, 95, 105, 120),
  units="degrees", template="geographics")
x2 <- circular(c(75, 80, 90, 100, 110, 130, 135, 140, 150, 160, 165),
  units="degrees", template="geographics")

watson.wheeler.test(list(x1,x2))



