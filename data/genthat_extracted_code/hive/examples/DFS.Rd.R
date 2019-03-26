library(hive)


### Name: DFS
### Title: Hadoop Distributed File System
### Aliases: DFS_cat DFS_delete DFS_dir_create DFS_dir_exists
###   DFS_dir_remove DFS_file_exists DFS_get_object DFS_list DFS_put
###   DFS_put_object DFS_read_lines DFS_rename DFS_tail DFS_write_lines

### ** Examples

## Do we have access to the root directory of the DFS?
## Not run: DFS_dir_exists("/")
## Some self-explanatory DFS interaction
## Not run: 
##D DFS_list( "/" )
##D DFS_dir_create( "/tmp/test" )
##D DFS_write_lines( c("Hello HDFS", "Bye Bye HDFS"), "/tmp/test/hdfs.txt" )
##D DFS_list( "/tmp/test" )
##D DFS_read_lines( "/tmp/test/hdfs.txt" )
## End(Not run)
## Serialize an R object to the HDFS
## Not run: 
##D foo <- function()
##D "You got me serialized."
##D sro <- "/tmp/test/foo.sro"
##D DFS_put_object(foo, sro)
##D DFS_get_object( sro )()
## End(Not run)
## finally (recursively) remove the created directory
## Not run: DFS_dir_remove( "/tmp/test" )



