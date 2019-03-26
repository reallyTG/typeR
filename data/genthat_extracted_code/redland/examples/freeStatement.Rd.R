library(redland)


### Name: freeStatement
### Title: Free memory used by a librdf statement
### Aliases: freeStatement freeStatement,Statement-method

### ** Examples

world <- new("World")
stmt <- new("Statement", world, subject="http://www.example.com/myevent",
                                predicate="http://example.com/occurredAt",
                                object="Tue Feb 17 14:05:13 PST 2015")
# At this point, some operations would be performed with the Statement.
# See '?redland' for a complete example.
# When the Statement object is no longer needed, the resources it had allocated can be freed.
freeStatement(stmt)                                
rm(stmt)



