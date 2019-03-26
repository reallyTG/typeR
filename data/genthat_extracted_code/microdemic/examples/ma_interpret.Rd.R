library(microdemic)


### Name: ma_interpret
### Title: Interpret API
### Aliases: ma_interpret

### ** Examples

## Not run: 
##D res <- ma_interpret(query = "papers by jaime'...")
##D res$query
##D res$interpretations
##D res$interpretations$parse
##D res$interpretations$rules
##D res$interpretations$rules[[1]]
##D 
##D expr <- res$interpretations$rules[[1]]$output.value
##D ma_evaluate(expr)
## End(Not run)



