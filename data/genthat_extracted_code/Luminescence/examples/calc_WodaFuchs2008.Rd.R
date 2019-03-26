library(Luminescence)


### Name: calc_WodaFuchs2008
### Title: Obtain the equivalent dose using the approach by Woda and Fuchs
###   2008
### Aliases: calc_WodaFuchs2008

### ** Examples


## read example data set
data(ExampleData.DeValues, envir = environment())

results <- calc_WodaFuchs2008(
  data = ExampleData.DeValues$CA1,
   xlab = expression(paste(D[e], " [Gy]"))
 )




