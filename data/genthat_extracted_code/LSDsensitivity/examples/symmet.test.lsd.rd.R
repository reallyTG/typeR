library(LSDsensitivity)


### Name: symmet.test.lsd
### Title: Unimodality and symmetry tests
### Aliases: symmet.test.lsd
### Keywords: models htest

### ** Examples

# Examples require the data files produced by LSD, please check the package
# notes and LSD documentation on how to generate you simulation results files

# Steps to use this function:
# 1. load data from a LSD simulation saved results using a read.xxx.lsd
#    function from LSDinterface package (read.3d.lsd, for instance)
# 2. use symmet.test.lsd to apply the tests on the relevant variables,
#    replacing "var1", "var2" etc. with your data

## No test: 
# read data from 3 Monte Carlo runs
library( LSDinterface )
dataSet <- read.3d.lsd( c( "Sim1_1.res", "Sim1_2.res", "Sim1_3.res" ) )

tests <- symmet.test.lsd( dataSet,              # the data set to use
                          c( "var1", "var2" ),  # the variables to test
                          signif = 0.01,        # use 1% significance
                          digits = 4,           # show results using 4 digits
                          sym.boot = TRUE )     # use bootstrap for precision

print( tests )
## End(No test)



