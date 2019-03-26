library(TSP)


### Name: Concorde
### Title: Using the Concorde TSP Solver
### Aliases: Concorde concorde concorde_path concorde_help linkern_help
### Keywords: documentation

### ** Examples

## Not run: 
##D ## see if Concorde is correctly installed
##D concorde_path()
##D 
##D 
##D ## set path to the Concorde executible if it is not in the search PATH
##D ## Example:
##D ## concorde_path("~/concorde/")
##D 
##D concorde_help()
##D 
##D data("USCA312")
##D 
##D ## run concorde only with fast cuts (-V)
##D solve_TSP(USCA312, method = "concorde", control = list(clo = "-V"))
## End(Not run)



