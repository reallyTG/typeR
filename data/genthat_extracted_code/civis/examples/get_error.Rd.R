library(civis)


### Name: get_error
### Title: Get error data from civis_errors
### Aliases: get_error

### ** Examples

## Not run: 
##D  q_id <- queries_post(db_id, query, n_rows, cred_id)[["id"]]
##D  r <- tryCatch(await(queries_get, id = q_id), error = function(e) e)
##D  print(r)
##D  get_error(r)
##D 
##D  r <- try(await(queries_get, id = q_id))
##D  get_error(r)
##D  
## End(Not run)



