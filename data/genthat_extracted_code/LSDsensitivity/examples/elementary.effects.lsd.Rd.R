library(LSDsensitivity)


### Name: elementary.effects.lsd
### Title: Elementary effects sensitivity analysis
### Aliases: elementary.effects.lsd
### Keywords: methods models design

### ** Examples

# Examples require the data files produced by LSD, please check the package
# notes and LSD documentation on how to generate you simulation results files.
# Please note that the full set of sensitivity analysis files must be available,
# as detailed in the help page for the read.doe.lsd function.

# Steps to use this function:
# 1. define the variables you want to use in the analysis
# 2. load data from a LSD simulation saved results using read.doe.lsd
# 3. perform the elementary effects analysis applying elementary.effects.lsd

## No test: 
lsdVars <- c( "var1", "var2", "var3" )         # the definition of existing variables

dataSet <- read.doe.lsd( ".",                  # data files relative folder
                         "Sim1",               # data files base name (same as .lsd file)
                         "var1",               # variable name to perform the sensitivity analysis
                         saveVars = lsdVars )  # LSD variables to keep in dataset

SA <- elementary.effects.lsd( dataSet,         # LSD experimental data set
                              p = 4,           # number of levels of the design (as set in LSD)
                              jump = 2 )       # number of jumps per level (as set in LSD)

print( SA )                                    # show analysis table
plot( SA )                                     # plot analysis chart
## End(No test)



