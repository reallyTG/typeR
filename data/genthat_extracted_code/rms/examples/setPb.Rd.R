library(rms)


### Name: setPb
### Title: Progress Bar for Simulations
### Aliases: setPb
### Keywords: utilities

### ** Examples

## Not run: 
##D options(showprogress=TRUE)   # same as ='tk'
##D pb <- setPb(1000)
##D for(i in 1:1000) {
##D    pb(i)   # pb(i, every=10) to only show for multiples of 10
##D    # your calculations
##D   }
##D # Force rms functions to do simulations to not report progress
##D options(showprogress='none')
##D # For functions that do simulations to use the console instead of pop-up
##D # Even with tcltk is installed
##D options(showprogress='console')
##D pb <- setPb(1000, label='Random Sampling')
## End(Not run)



