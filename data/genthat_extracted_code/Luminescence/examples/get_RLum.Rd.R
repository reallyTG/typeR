library(Luminescence)


### Name: get_RLum
### Title: General accessor function for RLum S4 class objects
### Aliases: get_RLum get_RLum,list-method get_RLum,NULL-method
### Keywords: utilities

### ** Examples


##Example based using data and from the calc_CentralDose() function

##load example data
data(ExampleData.DeValues, envir = environment())

##apply the central dose model 1st time
temp1 <- calc_CentralDose(ExampleData.DeValues$CA1)

##get results and store them in a new object
temp.get <- get_RLum(object = temp1)




