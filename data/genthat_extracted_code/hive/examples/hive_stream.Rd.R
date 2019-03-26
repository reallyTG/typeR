library(hive)


### Name: hive_stream
### Title: Hadoop Streaming with package 'hive'
### Aliases: hive_stream

### ** Examples

## A simple word count example

## Put some xml files on the HDFS:
## Not run: 
##D DFS_put( system.file("defaults/core/", package = "hive"),
##D                   "/tmp/input" )
## End(Not run)
## Not run: 
##D DFS_put( system.file("defaults/hdfs/hdfs-default.xml", package = "hive"),
##D                   "/tmp/input" )
## End(Not run)
## Not run: 
##D DFS_put( system.file("defaults/mapred/mapred-default.xml", package = "hive"),
##D                   "/tmp/input" )
## End(Not run)
## Define the mapper and reducer function to be applied:
## Note that a Hadoop map or reduce job retrieves data line by line from stdin.
## Not run: 
##D mapper <- function(x){
##D     con <- file( "stdin", open = "r" )
##D     while (length(line <- readLines(con, n = 1L, warn = FALSE)) > 0) {
##D         terms <- unlist(strsplit(line, " "))
##D         terms <- terms[nchar(terms) > 1 ]
##D         if( length(terms) )
##D             cat( paste(terms, 1, sep = "\t"), sep = "\n")
##D     }
##D }
##D reducer <- function(x){
##D     env <- new.env( hash = TRUE )
##D     con <- file( "stdin", open = "r" )
##D     while (length(line <- readLines(con, n = 1L, warn = FALSE)) > 0) {
##D         keyvalue <- unlist( strsplit(line, "\t") )
##D         if( exists(keyvalue[1], envir = env, inherits = FALSE) ){
##D             assign( keyvalue[1], get(keyvalue[1], envir = env) + as.integer(keyvalue[2]),
##D                     envir = env )
##D         } else {
##D             assign( keyvalue[1], as.integer(keyvalue[2]), envir = env )
##D         }
##D     }
##D     env <- as.list(env)
##D     for( term in names(env) )
##D         writeLines( paste(c(term, env[[term]]), collapse ="\t") )
##D }
##D hive_set_nreducer(1)
##D hive_stream( mapper = mapper, reducer = reducer, input = "/tmp/input", output = "/tmp/output" )
##D DFS_list("/tmp/output")
##D head( DFS_read_lines("/tmp/output/part-00000") )
## End(Not run)
## Don't forget to clean file system
## Not run: DFS_dir_remove("/tmp/input")
## Not run: DFS_dir_remove("/tmp/output")



