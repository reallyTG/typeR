library(DSL)


### Name: KeyValue
### Title: Key/Value Pairs
### Aliases: DKeys

### ** Examples

## create a 2 elements DList
dl <- DList( line1 = "This is the first line.",
             line2 = "Now, the second line." )
## retrieve keys
DKeys( dl )
## remove DList and garbage collect it
rm( dl )
gc()



