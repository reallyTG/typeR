library(dataone)


### Name: hasReservation
### Title: Checks to determine if the supplied subject is the owner of the
###   reservation of id.
### Aliases: hasReservation hasReservation,CNode-method

### ** Examples

## Not run: 
##D library(dataone)
##D cn <- CNode("STAGING")
##D creds <- echoCredentials(cn)
##D subject <- creds$person$subject
##D # Previously reserved pid (using reserveIdentifeir()), e.g. DOI or uuid
##D pid <- "urn:node:e27bb4f3-96bb-4af4-8902-f5914def077c"
##D hasRes <- hasReservation(cn, pid, subject=subject)
## End(Not run)



