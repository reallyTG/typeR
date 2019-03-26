library(nws)


### Name: nwsDeclare
### Title: Declare a netWorkSpace Variable
### Aliases: nwsDeclare nwsDeclare-methods nwsDeclare,netWorkSpace-method
### Keywords: methods

### ** Examples

## Not run: 
##D ws <- netWorkSpace('nws example')
##D nwsDeclare(ws, 'pi', 'single')
##D nwsStore(ws, 'pi', 2.171828182)
##D nwsStore(ws, 'pi', 3.141592654)
##D nwsListVars(ws)  # shows that only the most recent value of pi is retained
## End(Not run)



