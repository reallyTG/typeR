library(unitizer)


### Name: unitizerState
### Title: Tests and Session State
### Aliases: unitizerState state state, in_pkg in_pkg

### ** Examples

## Not run: 
##D ## In this examples we use `...` to denote other arguments to `unitize` that
##D ## you should specify.  All examples here apply equally to `unitize_dir`
##D 
##D ## Run with recommended state tracking settings
##D unitize(..., state="recommended")
##D ## Manage as much of state as possible
##D unitize(..., state="pristine")
##D 
##D ## No state management, but evaluate with custom env as parent env
##D my.env <- new.env()
##D unitize(..., state=my.env)
##D ## use custom environment, and turn on search.path tracking
##D ## here we must use the `state` function to construct a state object
##D unitize(..., state=state(par.env=my.env, search.path=2))
##D 
##D ## Specify a namespace to run in by name
##D unitize(..., state="stats")
##D unitize(..., state=state(par.env="stats")) # equivalent to previous
##D 
##D ## Let `unitizer` figure out the namespace from the test file location;
##D ## assumes test file is inside package folder structure
##D unitize("mytests.R", state=in_pkg()) # assuming mytests.R is part of a pkg
##D unitize("mytests.R", state=in_pkg("mypkg")) # also works
## End(Not run)



