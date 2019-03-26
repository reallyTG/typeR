library(sybil)


### Name: SYBIL_SETTINGS
### Title: Set and Get sybil Parameters
### Aliases: SYBIL_SETTINGS SOLVER METHOD TOLERANCE MAXIMUM ALGORITHM
###   OPT_DIRECTION USE_NAMES PATH_TO_MODEL SOLVER_CTRL_PARM
### Keywords: optimize

### ** Examples

  ## show all current parameters
  SYBIL_SETTINGS()
  
  ## show current setting for "SOLVER"
  SYBIL_SETTINGS("SOLVER")

  ## change current solver to glpkAPI
  SYBIL_SETTINGS("SOLVER", "glpkAPI")
## Not run: 
##D   ## this needs cplexAPI installed
##D   ## change current solver to cplexAPI
##D   SYBIL_SETTINGS("SOLVER", "cplexAPI")
## End(Not run)



