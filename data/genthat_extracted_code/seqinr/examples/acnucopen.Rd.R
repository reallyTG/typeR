library(seqinr)


### Name: acnucopen
### Title: open and close a remote access to an ACNUC database
### Aliases: acnucopen acnucclose clientid quitacnuc
### Keywords: utilities

### ** Examples

 ## Not run: 
##D # Need internet connection
##D   mysocket <- socketConnection( host = "pbil.univ-lyon1.fr", 
##D     port = 5558, server = FALSE, blocking = TRUE)
##D   readLines(mysocket, n = 1) # OK acnuc socket started
##D   acnucopen("emblTP", socket = mysocket) -> res
##D   expected <- c("EMBL", "14138095", "236401", "1186228", "8", 
##D     "16", "40", "40", "20", "20", "40", "60", "504")
##D   stopifnot(all(unlist(res) == expected))
##D   tryalreadyopen <- try(acnucopen("emblTP", socket = mysocket))
##D   stopifnot(inherits(tryalreadyopen, "try-error"))
##D   # Need a fresh socket because acnucopen() close it if error:
##D   mysocket <- socketConnection( host = "pbil.univ-lyon1.fr", 
##D     port = 5558, server = FALSE, blocking = TRUE)
##D   tryoff <-  try(acnucopen("off", socket = mysocket))
##D   stopifnot(inherits(tryoff, "try-error"))
##D 
##D   mysocket <- socketConnection( host = "pbil.univ-lyon1.fr", 
##D     port = 5558, server = FALSE, blocking = TRUE)
##D   tryinexistent <-  try(acnucopen("tagadatagadatsointsoin", socket = mysocket))
##D   stopifnot(inherits(tryinexistent, "try-error"))
##D 
##D   mysocket <- socketConnection( host = "pbil.univ-lyon1.fr", 
##D     port = 5558, server = FALSE, blocking = TRUE)
##D   trycloseunopened <- try(acnucclose(mysocket))
##D   stopifnot(inherits(trycloseunopened, "try-error"))
##D 
##D  
## End(Not run)



