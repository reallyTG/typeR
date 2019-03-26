library(saves)


### Name: loads
### Title: Loading only given variables of a data.frame from binary file
### Aliases: loads

### ** Examples

## Not run: 
##D # Loading the 'v1' and 'v5' variables of the demo dataset.
##D data(evs.2000.hun)
##D saves(evs.2000.hun)
##D evs.filtered.list <- loads("evs.2000.hun.RDatas", c('v1', 'v5'))
##D evs.filtered.df <- loads("evs.2000.hun.RDatas", c('v1', 'v5'), to.data.frame=TRUE)
## End(Not run)



