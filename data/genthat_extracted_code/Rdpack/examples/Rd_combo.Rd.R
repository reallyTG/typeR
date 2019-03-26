library(Rdpack)


### Name: Rd_combo
### Title: Manipulate a number of Rd files
### Aliases: Rd_combo
### Keywords: Rd

### ** Examples

## Not run: 
##D rdnames <- dir(path = "./man", pattern=".*[.]Rd$", full.names=TRUE)
##D 
##D Rd_combo(rdnames, reprompt)
##D for(nam in rdnames) try(reprompt(nam))
##D for(nam in rdnames) try(reprompt(nam, sec_copy=FALSE))
##D 
## End(Not run)



