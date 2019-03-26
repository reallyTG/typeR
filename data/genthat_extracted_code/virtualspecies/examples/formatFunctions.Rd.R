library(virtualspecies)


### Name: formatFunctions
### Title: Format and visualise functions used to generate virtual species
###   with 'generateSpFromFun'
### Aliases: formatFunctions

### ** Examples

my.parameters <- formatFunctions(variable1 = c(fun = 'dnorm',
                                            mean = 0.00012, sd = 0.0001),
                              variable2 = c(fun = 'linearFun', a = 1, b = 0))


my.parameters <- formatFunctions(bio1 = c(fun = "logisticFun", 
                                         alpha = -12.7, beta = 68),
                                 bio2 = c(fun = "linearFun", 
                                          a = -0.03, b = 191.2),
                                 bio3 = c(fun = "dnorm", 
                                          mean = 86.4, sd = 19.1),
                                 bio4 = c(fun = "logisticFun", 
                                          alpha = 2198.5, beta = 11381.4))
## Not run: 
##D # An example using worldclim data
##D bio1.4 <- getData('worldclim', var='bio', res=10)[[1:4]]
##D my.parameters <- formatFunctions(x = bio1.4,
##D                                  bio1 = c(fun = "logisticFun", 
##D                                           alpha = -12.7, beta = 68),
##D                                  bio2 = c(fun = "linearFun", 
##D                                           a = -0.03, b = 191.2),
##D                                  bio3 = c(fun = "dnorm", 
##D                                           mean = 86.4, sd = 19.1),
##D                                  bio4 = c(fun = "logisticFun", 
##D                                           alpha = 2198.5, beta = 11381.4))
## End(Not run)



