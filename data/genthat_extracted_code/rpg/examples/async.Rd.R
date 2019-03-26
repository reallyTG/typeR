library(rpg)


### Name: async_query
### Title: Asynchronous query processing
### Aliases: async_query async_status is_busy cancel finish_async

### ** Examples

## Not run: 
##D # create a database
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D 
##D # write data frame contents
##D data(mtcars)
##D write_table(mtcars)
##D 
##D # async processing on smallish result
##D # this wont be interesting if your machine is very fast
##D async_query("SELECT a.* FROM mtcars a, mtcars b")
##D repeat
##D {
##D   status = async_status()
##D   if ( status != "BUSY" ) break
##D   cat("busy...\n")
##D   Sys.sleep(1)
##D }
##D print(status)
##D head(fetch())
##D finish_async()
##D Sys.sleep(1)
##D 
##D # async processing on larger result
##D async_query("SELECT a.* FROM mtcars a, mtcars b, mtcars c")
##D count = 0
##D repeat
##D {
##D   status = async_status()
##D   if ( status == "BUSY" )
##D   {
##D     if ( count > 2 )
##D     {
##D       cat("calling cancel...\n")
##D       cancel()
##D     }
##D   }
##D   else break
##D   cat("busy... \n")
##D   Sys.sleep(1)
##D   count = count + 1
##D }
##D print(status)
##D finish_async()
##D 
##D # you can run multiple queries with async_query
##D rollback(); begin()
##D write_table(mtcars)
##D sql1 = "SELECT mpg FROM mtcars LIMIT 3"
##D sql2 = "SELECT cyl FROM mtcars LIMIT 4"
##D async_query(paste(sql1, sql2, sep = "; "))
##D while ( async_status() == "BUSY" ) NULL
##D fetch()
##D while ( is_busy() ) NULL
##D async_status()
##D fetch()
##D finish_async()
##D 
##D # issue an async query and come back later
##D async_query(sql1)
##D push_conn()
##D connect("rpgtesting")
##D 
##D # fails because of transaction isolation
##D fetch(sql2)
##D pop_conn()
##D async_status()
##D 
##D # results from sql1
##D fetch()
##D 
##D # this is automatic if you issue new queries
##D finish_async()
##D 
##D # cleanup
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run) 




