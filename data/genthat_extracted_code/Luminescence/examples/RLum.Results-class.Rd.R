library(Luminescence)


### Name: RLum.Results-class
### Title: Class '"RLum.Results"'
### Aliases: RLum.Results-class show,RLum.Results-method
###   set_RLum,RLum.Results-method get_RLum,RLum.Results-method
###   length_RLum,RLum.Results-method names_RLum,RLum.Results-method
### Keywords: classes internal methods

### ** Examples


showClass("RLum.Results")

##create an empty object from this class
set_RLum(class = "RLum.Results")

##use another function to show how it works

##Basic calculation of the dose rate for a specific date
 dose.rate <-  calc_SourceDoseRate(
   measurement.date = "2012-01-27",
   calib.date = "2014-12-19",
   calib.dose.rate = 0.0438,
   calib.error = 0.0019)

##show object
dose.rate

##get results
get_RLum(dose.rate)

##get parameters used for the calcualtion from the same object
get_RLum(dose.rate, data.object = "parameters")

##alternatively objects can be accessed using S3 generics, such as
dose.rate$parameters




