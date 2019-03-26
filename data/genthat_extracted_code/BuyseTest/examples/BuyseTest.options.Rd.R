library(BuyseTest)


### Name: BuyseTest.options
### Title: Global options for BuyseTest package
### Aliases: BuyseTest.options

### ** Examples

 
## see all global parameters
BuyseTest.options()

## see some of the global parameters
BuyseTest.options("n.resampling", "trace")

## update some of the global parameters
BuyseTest.options(n.resampling = 10, trace = 1)
BuyseTest.options("n.resampling", "trace")

## reinitialise all global parameters
BuyseTest.options(reinitialise = TRUE)



