library(nws)


### Name: nwsVariable
### Title: Create an Active Binding for a netWorkSpace Variable
### Aliases: nwsVariable-methods nwsVariable,netWorkSpace-method
###   nwsVariable
### Keywords: methods

### ** Examples

  ## Not run: 
##D # create a netWorkSpace
##D ws = netWorkSpace('nws example')
##D 
##D # create a variable in the local R workspace that is linked to
##D # a netWorkSpace variable
##D nwsVariable(ws, 'x', 'single')
##D 
##D x <- 0
##D x <- 999  # overwrites the 0
##D x <- 3.14159  # overwrites the 999
##D x   # returns 3.14159
##D x   # returns 3.14159
##D x   # returns 3.14159
##D 
##D # create a 'fifo' mode variable
##D nwsVariable(ws, 'message', 'fifo')
##D 
##D message <- 1
##D message <- 2
##D message <- 3
##D message  # returns 1
##D message  # returns 2
##D message  # returns 3
##D   
## End(Not run)



