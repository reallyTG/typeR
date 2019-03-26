library(webchem)


### Name: pp_query
### Title: Query SRC PHYSPROP Database
### Aliases: pp_query

### ** Examples

## Not run: 
##D pp_query('50-00-0')
##D out <- pp_query(c('50-00-0', '79622-59-6', 'xxxxx'))
##D out
##D 
##D # extract lop-P
##D sapply(out, function(y){
##D  if (length(y) == 1 && is.na(y))
##D    return(NA)
##D  y$prop$value[y$prop$variable == 'Log P (octanol-water)']
##D  })
## End(Not run)



