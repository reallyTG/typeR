library(LSDsensitivity)


### Name: model.pred.lsd
### Title: Predict meta-model response at given point(s)
### Aliases: model.pred.lsd
### Keywords: models design

### ** Examples

# Examples require the data files produced by LSD, please check the package
# notes and LSD documentation on how to generate you simulation results files.
# Please note that the full set of sensitivity analysis files must be available,
# as detailed in the help page for the read.doe.lsd function.

# Steps to use this function:
# 1. define the variables you want to use in the analysis
# 2. load data from a LSD simulation saved results using read.doe.lsd
# 3. fit a Kriging (or polynomial) meta-model using kriging.model.lsd
# 4. estimate the meta-model response at any set of points applying
#    model.pred.lsd

## No test: 
lsdVars <- c( "var1", "var2", "var3" )         # the definition of existing variables

dataSet <- read.doe.lsd( ".",                  # data files relative folder
                         "Sim1",               # data files base name (same as .lsd file)
                         "var1",               # variable name to perform the sensitivity analysis
                         does = 2,             # number of experiments (data + external validation)
                         saveVars = lsdVars )  # LSD variables to keep in dataset

model <- kriging.model.lsd( dataSet )          # estimate best Kriging meta-model

# creates a set of three random points
points <- data.frame( var1 = rnorm( 3 ), var2 = rnorm( 3 ), var3 = rnorm( 3 ) )

response <- model.pred.lsd( points, model )    # predict model response at the 3 points

print( response$lower, response$mean, response$upper )
## End(No test)



