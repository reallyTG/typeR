library(rAverage)


### Name: datgen
### Title: Generating Noisy Responses for an Averaging Model
### Aliases: datgen
### Keywords: misc

### ** Examples
## Not run: 
##D # Generating random parameters for a 3x4 design:
##D par <- pargen(lev = c(3,4), s.range = c(0,20))
##D # Computing the responses:
##D R <- datgen(param=par, lev=c(3,4), sd=0) ; R
##D R <- datgen(param=par, lev=c(3,4), sd=1, trials=10, range=c(0,20)) ; R
## End(Not run)


