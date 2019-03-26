library(DSL)


### Name: MapReduce
### Title: MapReduce for '"DList"' Objects
### Aliases: DLapply DMap DReduce

### ** Examples

dl <- DList( line1 = "This is the first line.",
             line2 = "Now, the second line." )
res <- DLapply( dl, function(x) unlist(strsplit(x, " ")) )
as.list( res )

foo <- function( keypair )
    list( key = paste("next_", keypair$key, sep = ""), value =
    gsub("first", "mapped", keypair$value) )

dlm <- DMap( x = dl, MAP = foo)
## retrieve keys
unlist(DGather(dlm, keys = TRUE, names = FALSE))
## retrieve values
as.list( dlm )
## simple wordcount based on two files:
dir(system.file("examples", package = "DSL"))
## first force 1 chunk per file (set max chunk size to 1 byte):
ds <- DStorage("LFS", tempdir(), chunksize = 1L)
## make "DList" from files, i.e., read contents and store in chunks
dl <- as.DList(system.file("examples", package = "DSL"), DStorage = ds)
## read files
dl <- DMap(dl, function( keypair ){
    list( key = keypair$key, value = tryCatch(readLines(keypair$value),
error = function(x) NA) )
})
## split into terms
splitwords <- function( keypair ){
    keys <- unlist(strsplit(keypair$value, " "))
    mapply( function(key, value) list( key = key, value = value), keys, rep(1L, length(keys)),
            SIMPLIFY = FALSE, USE.NAMES = FALSE )
}
res <- DMap( dl, splitwords )
as.list(res)
## now aggregate by term
res <- DReduce( res, sum )
as.list( res )



