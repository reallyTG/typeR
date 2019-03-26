library(Luminescence)


### Name: analyse_IRSAR.RF
### Title: Analyse IRSAR RF measurements
### Aliases: analyse_IRSAR.RF
### Keywords: datagen

### ** Examples


##load data
data(ExampleData.RLum.Analysis, envir = environment())

##(1) perform analysis using the method 'FIT'
results <- analyse_IRSAR.RF(object = IRSAR.RF.Data)

##show De results and test paramter results
get_RLum(results, data.object = "data")
get_RLum(results, data.object = "test_parameters")

##(2) perform analysis using the method 'SLIDE'
results <- analyse_IRSAR.RF(object = IRSAR.RF.Data, method = "SLIDE", n.MC = 1)

## Not run: 
##D ##(3) perform analysis using the method 'SLIDE' and method control option
##D ## 'trace
##D results <- analyse_IRSAR.RF(
##D  object = IRSAR.RF.Data,
##D  method = "SLIDE",
##D  method.control = list(trace = TRUE))
##D 
## End(Not run)




