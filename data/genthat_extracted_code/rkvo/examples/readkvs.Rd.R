library(rkvo)


### Name: readkvs
### Title: Read key/value pair observations.
### Aliases: readkvs

### ** Examples

## Not run: 
##D ## Assume that we have a file at path "file.dat" with the
##D ## following contents:
##D ##
##D ## key1=value11;key2=value12
##D ## key1=value21;key2=value22
##D ## key1=value31;key2=value320;key2=value321
##D ##
##D ## Let's read this in and display as a matrix:
##D observations <- readkvs("file.dat", ";", "=")
##D do.call(rbind, observations)
## End(Not run)



