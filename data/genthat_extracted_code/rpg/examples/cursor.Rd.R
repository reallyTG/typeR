library(rpg)


### Name: cursor
### Title: Iterator support
### Aliases: cursor

### ** Examples

## Not run: 
##D # example requires foreach
##D if (! require(foreach, quietly = TRUE))
##D  stop("This example requires the \'foreach\' package")
##D 
##D # connect using defaults
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D  
##D # write data frame contents
##D data(mtcars)
##D write_table(mtcars, row_names = "id", pkey = "id", overwrite = TRUE)
##D 
##D # expand rows to columns 8 rows at a time
##D x = foreach(i = cursor("SELECT * FROM mtcars", by = 8),
##D             .combine = rbind) %do% { i$mpg }
##D print(x, digits = 2)
##D         
##D # parallel example
##D if (require(doParallel, quietly = TRUE))
##D {
##D  # make the cluster
##D  cl = makeCluster(2)
##D  
##D  # must connect to database on each node
##D  clusterEvalQ(cl, library(rpg))
##D  clusterEvalQ(cl, connect("rpgtesting"))
##D  clusterEvalQ(cl, begin())
##D  
##D  # setup the dopar call
##D  registerDoParallel(cl)
##D  
##D  # take column averages 4 rows at a time
##D  curs1 = cursor("SELECT * FROM mtcars", by = 4)
##D  x = foreach(i = curs1, .combine = rbind, .inorder = FALSE) %dopar%
##D  {
##D    rr = paste0(range(abbreviate(i$id)), collapse = "-")
##D    pid = get_conn_info("server.pid")
##D    j = names(i) != "id"
##D    mn = signif(apply(i[, j], 2, mean), 2)
##D    c(rows = rr, backend = pid, mn)
##D  }
##D  x = as.data.frame(x)
##D  row.names(x) = x$rows
##D  x$rows = NULL
##D  print(noquote(x))
##D  
##D  clusterEvalQ(cl, rollback())
##D  stopCluster(cl)
##D }
##D 
##D #cleanup
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




