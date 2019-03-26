library(LSDsensitivity)


### Name: response.surface.lsd
### Title: Generate the meta-model 3D response surface data
### Aliases: response.surface.lsd
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
# 4. identify the most influential factors applying sobol.decomposition.lsd
# 5. calculate the response surface for the selected factors using model.limits.lsd
# 6. plot the response surface

## No test: 
lsdVars <- c( "var1", "var2", "var3" )          # the definition of existing variables

dataSet <- read.doe.lsd( ".",                   # data files relative folder
                         "Sim1",                # data files base name (same as .lsd file)
                         "var1",                # variable name to perform the sensitivity analysis
                         does = 2,              # number of experiments (data + external validation)
                         saveVars = lsdVars )   # LSD variables to keep in dataset

model <- kriging.model.lsd( dataSet )           # estimate best Kriging meta-model

SA <- sobol.decomposition.lsd( dataSet, model ) # find Sobol indexes

resp <- response.surface.lsd( dataSet,          # LSD experimental data set
                              model,            # estimated meta-model
                              SA )              # Sobol sensitivity analysis results

theta3d <- 40                                   # horizontal view angle
phi3d <- 30                                     # vertical view angle
grid3d <- 25

for( i in 1 : 3 ) {                             # do for each top factor
                                                # plot 3D grid charts
  zMat <- matrix( resp$calib[[ i ]]$mean, grid3d, grid3d, byrow = TRUE )
  zlim <- range( zMat, na.rm = TRUE )

  vt <- persp( resp$grid[[ 1 ]], resp$grid[[ 2 ]], zMat, col = "gray90",
               xlab = colnames( dataSet$doe )[ SA$topEffect[ 1 ] ], zlim = zlim,
               ylab = colnames( dataSet$doe )[ SA$topEffect[ 2 ] ], zlab = dataSet$saVarName,
               theta = theta3d, phi = phi3d, ticktype = "detailed" )
}
## End(No test)



