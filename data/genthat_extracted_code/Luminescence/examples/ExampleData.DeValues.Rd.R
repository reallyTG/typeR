library(Luminescence)


### Name: ExampleData.DeValues
### Title: Example De data sets for the package Luminescence
### Aliases: ExampleData.DeValues
### Keywords: datasets

### ** Examples


##(1) plot values as histogram
data(ExampleData.DeValues, envir = environment())
plot_Histogram(ExampleData.DeValues$BT998, xlab = "De [s]")

##(2) plot values as histogram (with second to gray conversion)
data(ExampleData.DeValues, envir = environment())

De.values <- Second2Gray(ExampleData.DeValues$BT998,
                         dose.rate = c(0.0438, 0.0019))


plot_Histogram(De.values, xlab = "De [Gy]")




