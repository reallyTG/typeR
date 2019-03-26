library(Luminescence)


### Name: calc_OSLLxTxRatio
### Title: Calculate Lx/Tx ratio for CW-OSL curves
### Aliases: calc_OSLLxTxRatio
### Keywords: datagen

### ** Examples


##load data
data(ExampleData.LxTxOSLData, envir = environment())

##calculate Lx/Tx ratio
results <- calc_OSLLxTxRatio(Lx.data, Tx.data, signal.integral = c(1:2),
                             background.integral = c(85:100))

##get results object
get_RLum(results)




