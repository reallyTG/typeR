library(webchem)


### Name: aw_query
### Title: Query http://www.alanwood.net/pesticides
### Aliases: aw_query

### ** Examples

## Not run: 
##D aw_query('Fluazinam', type = 'commonname')
##D out <- aw_query(c('Fluazinam', 'Diclofop'), type = 'com')
##D out
##D # extract subactivity from object
##D sapply(out, function(y) y$subactivity[1])
##D 
##D # use CAS-numbers
##D aw_query("79622-59-6", type = 'cas')
## End(Not run)



