library(Luminescence)


### Name: calc_SourceDoseRate
### Title: Calculation of the source dose rate via the date of measurement
### Aliases: calc_SourceDoseRate
### Keywords: manip

### ** Examples



##(1) Simple function usage
##Basic calculation of the dose rate for a specific date
dose.rate <-  calc_SourceDoseRate(measurement.date = "2012-01-27",
                                  calib.date = "2014-12-19",
                                  calib.dose.rate = 0.0438,
                                  calib.error = 0.0019)

##show results
get_RLum(dose.rate)

##(2) Usage in combination with another function (e.g., Second2Gray() )
## load example data
data(ExampleData.DeValues, envir = environment())

## use the calculated variable dose.rate as input argument
## to convert De(s) to De(Gy)
Second2Gray(ExampleData.DeValues$BT998, dose.rate)

##(3) source rate prediction and plotting
dose.rate <-  calc_SourceDoseRate(measurement.date = "2012-01-27",
                                  calib.date = "2014-12-19",
                                  calib.dose.rate = 0.0438,
                                  calib.error = 0.0019,
                                  predict = 1000)
plot_RLum(dose.rate)


##(4) export output to a LaTeX table (example using the package 'xtable')
## Not run: 
##D xtable::xtable(get_RLum(dose.rate))
##D 
## End(Not run)




