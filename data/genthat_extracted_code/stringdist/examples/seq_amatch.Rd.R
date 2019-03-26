library(stringdist)


### Name: seq_amatch
### Title: Approximate matching for integer sequences.
### Aliases: seq_amatch seq_ain

### ** Examples


x <- list(1:3,c(3:1),c(1L,3L,4L))
table <- list(
  c(5L,3L,1L,2L)
  ,1:4
)
seq_amatch(x,table,maxDist=2)

# behaviour with missings
seq_amatch(list(c(1L,NA_integer_,3L),NA_integer_), list(1:3),maxDist=1)


## Not run: 
##D # Match sentences based on word order. Note: words must match exactly or they
##D # are treated as completely different.
##D #
##D # For this example you need to have the 'hashr' package installed.
##D x <- "Mary had a little lamb"
##D x.words <- strsplit(x,"[[:blank:]]+")
##D x.int <- hashr::hash(x.words)
##D table <- c("a little lamb had Mary",
##D            "had Mary a little lamb")
##D table.int <- hashr::hash(strsplit(table,"[[:blank:]]+"))
##D seq_amatch(x.int,table.int,maxDist=3)
## End(Not run)



