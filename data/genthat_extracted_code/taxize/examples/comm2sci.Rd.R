library(taxize)


### Name: comm2sci
### Title: Get scientific names from common names.
### Aliases: comm2sci

### ** Examples

## Not run: 
##D comm2sci(commnames='black bear')
##D comm2sci(commnames='black bear', simplify = FALSE)
##D comm2sci(commnames='black bear', db='itis')
##D comm2sci(commnames='annual blue grass', db='tropicos')
##D comm2sci(commnames=c('annual blue grass','tree of heaven'), db='tropicos')
##D comm2sci(commnames=c('black bear', 'roe deer'))
##D comm2sci('blue whale', db = "worms")
##D comm2sci(c('blue whale', 'dwarf surfclam'), db = "worms")
##D 
##D # Output easily converts to a data.frame with plyr::ldply
##D library(plyr)
##D ldply(comm2sci(commnames=c('annual blue grass','tree of heaven'),
##D   db='tropicos'))
##D 
##D # ncbi: pass in uid's from get_uid() directly
##D x <- get_uid("western capercaillie", modifier = "Common Name")
##D comm2sci(x)
##D # itis: pass in tsn's from get_tsn() directly
##D x <- get_tsn(c("Louisiana black bear", "american crow"),
##D   searchtype = "common")
##D comm2sci(x)
## End(Not run)



