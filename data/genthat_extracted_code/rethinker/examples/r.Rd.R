library(rethinker)


### Name: r
### Title: ReQL root
### Aliases: r

### ** Examples

## Not run: 
##D #Connect to the RethinkDB instance
##D cn<-openConnection()
##D 
##D #Get document count in some_db's some_table
##D r()$db("some_db")$table("some_table")$count()$run(cn)
##D #...same can be done shorter
##D r("some_db","some_table")$count()$run(cn)
##D 
##D #Fetch 5 random docs from some_db's some_table...
##D r("some_db","some_table")$sample(5)$run(cn)->cursor
##D #...and present as a list`
##D cursorToList(cursor)
##D 
##D #Insert an element
##D r("some_db","some_table")$insert(list(id="new",a=1:10,b=list(c=1,d=2)))$run(cn)
##D 
##D #Close connection
##D close(cn)
## End(Not run)



