library(lsa)


### Name: query
### Title: Query (Matrices)
### Aliases: query
### Keywords: array

### ** Examples


# prepare some files
td = tempfile()
dir.create(td)
write( c("dog", "cat", "mouse"), file=paste(td,"D1", sep="/") )
write( c("hamster", "mouse", "sushi"), file=paste(td,"D2", sep="/") )
write( c("dog", "monster", "monster"), file=paste(td,"D3", sep="/") )

# demonstrate generation of a query
dtm = textmatrix(td)
query("monster", rownames(dtm))
query("monster dog", rownames(dtm))

# clean up
unlink(td, TRUE)




