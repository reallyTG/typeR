library(RCassandra)


### Name: RC.connect
### Title: Connect, login, close connection to Cassandra
### Aliases: RC.connect RC.close RC.login
### Keywords: interface

### ** Examples

## Not run: 
##D c <- RC.connect("cassandra-host")
##D RC.login(c, "foo", "bar")
##D RC.cluster.name(c)
##D RC.describe.keyspaces(c)
##D RC.close(c)
## End(Not run)



