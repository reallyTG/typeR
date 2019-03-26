library(LSDsensitivity)


### Name: read.doe.lsd
### Title: Read a set of experimental data from a LSD model
### Aliases: read.doe.lsd
### Keywords: interface file datasets datagen design

### ** Examples

# Examples require the data files produced by LSD, please check the package
# notes and LSD documentation on how to generate you simulation results files.
# Please note that the full set of sensitivity analysis files must be available,
# as detailed in the help page for the read.doe.lsd function.

# Steps to use this function:
# 1. define the variables you want to use in the analysis
# 2. optionally, define special handling functions (see examples below)
# 3. load data from a LSD simulation saved results using read.doe.lsd
# 4. perform the elementary effects analysis applying elementary.effects.lsd

## No test: 
# the definition of existing, to take log and to be added variables
lsdVars <- c( "var1", "var2", "var3" )
logVars <- c( "var1", "var3" )
newVars <- c( "var4" )

# load data from a LSD simulation baseline configuration named "Sim1.lsd" to
# perform sensitivity analysis on the variable named "var1"
# there are two groups of sampled data (DoEs) created by LSD being read
dataSet <- read.doe.lsd( ".",                  # data files relative folder
                         "Sim1",               # data files base name (same as .lsd file)
                         "var1",               # variable name to perform the sens. analysis
                         does = 2,             # # of experiments (data + external validation)
                         iniDrop = 0,          # initial time steps to drop (0=none)
                         nKeep = -1,           # number of time steps to keep (-1=all)
                         saveVars = lsdVars,   # LSD variables to keep in dataset
                         addVars = newVars,    # new variables to add to the LSD dataset
                         eval.vars = eval.vars,# function to evaluate/adjust/expand the dataset
                         eval.run = eval.run,  # function to evaluate the DoE point response
                         rm.temp = FALSE,      # remove temporary speedup files?
                         rm.outl = FALSE,      # remove outliers from dataset
                         lim.outl = 10 )       # limit non-outliers deviation (# of std. devs.)


#### OPTIONAL HANDLING FUNCTION EXAMPLES ####

# eval.vars( ) EXAMPLE 1
# the definition of a function to take the log of the required variables () and
# compute the new ones (for use on pool = TRUE databases)

eval.vars <- function( dataSet, allVars ) {
  tsteps <- nrow( dataSet )        # number of time steps in simulated data set
  nvars <- ncol( dataSet )         # number of variables in data set (including new ones)

  # ---- Recompute values for existing variables ----
  for( var in allVars ) {
    if( var %in% logVars ) {     # take the log values of selected variables
      try( dataSet[ , var ] <- log( dataSet[ , var ] ), silent = TRUE )  # <= 0 as NaN
    }
  }

  # ---- Calculate values of new variables (added to LSD dataset) ----
  dataSet[ , "var4" ] <- dataSet[ , "var1" ] + dataSet[ , "var2" ]   # example of new var

  return( dataSet )
}


# eval.vars( ) EXAMPLE 2
# the definition of a function to compute the new variables
# (for use on pool = FALSE databases)

# ---- 4D data frame version (when pool = FALSE) ----

eval.vars <- function( data, vars ) {
  tsteps <- length( data [ , 1, 1, 1 ] )
  nvars <- length( data [ 1, , 1, 1 ] )
  insts <- length( data [ 1, 1, , 1 ] )
  samples <- length( data [ 1, 1, 1, ] )

  # ---- Compute values for new variables, preventing infinite values ----
  for( m in 1 : samples )               # for all MC samples (files)
    for( j in 1 : insts )               # all instances
      for( i in 1 : tsteps )            # all time steps
        for( var in vars ) {            # and all variables

          if( var == "var4" ) {
            # Normalization of key variables using the period average size
            mean <- mean( data[ i, "var2", , m ], na.rm = TRUE )
            if( is.finite ( mean ) && mean != 0 )
              data[ i, var, j, m ] <- data[ i,"var2", j, m ] / mean
            else
              data[ i, var, j, m ] <- NA
          }
        }
  return( data )
}


# eval.run( ) EXAMPLE
# the definition of a function to evaluate a point in the DoE, associating a result
# with it (in terms of average result and dispersion/S.D.)
# the example evaluates the fat-taildness of the distribution of the selected
# variable, using the Subbotin distribution b parameter as metric (response)

#library( normalp )

eval.run <- function( data, mcRun, varIdx, confInt ) {

  obs <- discards <- 0

  # ------ Compute Subbotin fits for each run ------
  bSubbo <- vector( "numeric" )
  for( i in 1 : dim( data )[ 3 ] ) {
    x <- data[[ mcRun, varIdx, i ]]
    sf <- paramp( x )
    sf$p <- estimatep( x, mu = sf$mean, p = sf$p, method = "inverse" )
    if( sf$p >= 1 )                          # use subbotools for p < 1
      res <- c( sf$p, sf$sp, sf$mp )

    # remove non significant results at the selected confidence interval
    if( res[ 1 ] / res[ 4 ] < qt( ( 1 - conf ) / 2, length( x ),
                                  lower.tail = FALSE ) ) {
      discards <- discards + 1
      bSubbo[ i ] <- NA
    } else {
      obs <- obs + 1
      bSubbo[ i ] <- res[ 1 ]
    }
  }

  return( list( mean( bSubbo, na.rm = TRUE ),
                var( bSubbo, na.rm = TRUE ), obs, discards ) )
}
## End(No test)



