library(Luminescence)


### Name: calc_AverageDose
### Title: Calculate the Average Dose and the dose rate dispersion
### Aliases: calc_AverageDose
### Keywords: datagen

### ** Examples


##Example 01 using package example data
##load example data
data(ExampleData.DeValues, envir = environment())

##calculate Average dose
##(use only the first 56 values here)
AD <- calc_AverageDose(ExampleData.DeValues$CA1[1:56,], sigma_m = 0.1)

##plot De and set Average dose as central value
plot_AbanicoPlot(
 data = ExampleData.DeValues$CA1[1:56,],
 z.0 = AD$summary$AVERAGE_DOSE)




