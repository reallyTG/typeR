library(civis)


### Name: await
### Title: Call a function repeatedly until a status is reached.
### Aliases: await await_all

### ** Examples

## Not run: 
##D 
##D    # Executing a query
##D    q_id <- queries_post(db_id, query, n_rows, cred_id)[["id"]]
##D    r <- await(queries_get, id = q_id)
##D    get_status(r)
##D 
##D    r <- tryCatch(await(queries_get, id = q_id), error = function(e) e)
##D    get_error(r)
##D 
##D    r <- try(await(queries_get, id = q_id))
##D    get_error(r)
##D 
## End(Not run)



