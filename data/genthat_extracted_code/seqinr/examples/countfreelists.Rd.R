library(seqinr)


### Name: countfreelists
### Title: The number of free lists available and annotation lines in an
###   ACNUC server
### Aliases: countfreelists cfl
### Keywords: utilities

### ** Examples

## Not run: 
##D  # Need internet connection
##D   choosebank("emblTP")
##D   (rescountfreelists <- countfreelists())
##D   stopifnot(all(rescountfreelists$annotlines == 
##D    c("ALL", "AC",  "PR",  "DT",  "KW",  "OS",  "OC",
##D    "OG",  "RN",  "RC",  "RP",  "RX", "RG",  "RA",  "RT",  "RL",  "DR", 
##D    "CC",  "AH",  "AS",  "FH",  "FT",  "CO",  "SQ", "SEQ")))
##D   closebank()
##D   
## End(Not run)



