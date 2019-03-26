library(SoDA)


### Name: chunksAdd
### Title: Manage counts of text chunks
### Aliases: chunksAdd chunksDrop
### Keywords: programming

### ** Examples

## Not run: 
##D if(require(RSPerl)){
##D   set.seed(314)
##D   someLetters <- sample(letters, 100, TRUE)
##D   tbl <- chunksAdd(data = someLetters[1:50])
##D   tbl <- chunksAdd(tbl, someLetters[51:100])
##D   tbl <- chunksDrop(tbl, someLetters[1:10])
##D   chunksAdd(tbl) # to convert the table
##D }
## End(Not run)




