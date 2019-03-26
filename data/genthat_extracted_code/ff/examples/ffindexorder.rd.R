library(ff)


### Name: ffindexorder
### Title: Sorting: chunked ordering of integer suscript positions
### Aliases: ffindexorder ffindexordersize
### Keywords: IO data

### ** Examples

     x <- ff(sample(40))
     message("fforder requires sorting")
     i <- fforder(x)
     message("applying this order i is done by ffindexget")
     x[i]
     message("applying this order i requires random access, 
       therefore ffindexget does chunkwise sorting")
     ffindexget(x, i)
     message("if we want to apply the order i multiple times,
       we can do the chunkwise sorting once and store it")
     s <- ffindexordersize(length(i), vmode(i), BATCHBYTES = 100)
     o <- ffindexorder(i, s$b)
     message("this is how the stored chunkwise sorting is used")
     ffindexget(x, i, o)
     message("")
     rm(x,i,s,o)
     gc()



