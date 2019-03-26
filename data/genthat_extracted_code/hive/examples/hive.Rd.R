library(hive)


### Name: hive
### Title: Hadoop Interactive Framework Control
### Aliases: hive .hinit hive_create hive_is_available hive_start hive_stop

### ** Examples

## read configuration and initialize a Hadoop cluster:
## Not run: h <- .hinit( "/etc/hadoop" )
## Not run: hive( h )
## Start hadoop cluster:
## Not run: hive_start()
## check the status of an Hadoop cluste:
## Not run: hive_is_available()
## return cluster configuration 'h':
hive()
## Stop hadoop cluster:
## Not run: hive_stop()



