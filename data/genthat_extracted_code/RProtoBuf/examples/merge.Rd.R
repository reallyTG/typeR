library(RProtoBuf)


### Name: merge-methods
### Title: Merge two messages of the same type
### Aliases: merge,Message,Message-method
### Keywords: methods

### ** Examples


m1 <- new( tutorial.Person, email = "francoisromain@free.fr" )
m2 <- new( tutorial.Person, id = 5 )
m3 <- merge( m1, m2 )
writeLines( as.character( m1 ) )
writeLines( as.character( m2 ) )
writeLines( as.character( m3 ) )




