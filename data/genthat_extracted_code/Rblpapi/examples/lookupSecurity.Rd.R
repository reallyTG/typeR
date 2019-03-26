library(Rblpapi)


### Name: lookupSecurity
### Title: Look up symbol from Bloomberg
### Aliases: lookupSecurity

### ** Examples

## Not run: 
##D   lookupSecurity("IBM")
##D   lookupSecurity("IBM", maxResuls=1000)    # appears to be capped at 1000
##D   lookupSecurity("IBM", "mtge")
##D   lookupSecurity("IBM ", "mtge")           # trailing space affects query
##D 
##D   ## modify the symbol column (cf issue ticket 215 at GitHub)
##D   res <- lookupSecurity("IBM")
##D   res[, "symbol"] <- sub(pattern="^(.+)<(.)(.+)>$", "\\1 \\U\\2\\E\\3",
##D                          perl=TRUE, res[, "security"])
##D   res
## End(Not run)



