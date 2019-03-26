library(DSL)


### Name: DGather
### Title: Gather Distributed Data
### Aliases: DGather

### ** Examples

dl <- DList( line1 = "This is the first line.",
             line2 = "Now, the second line." )
DGather( dl )
## retrieve keys
unlist(DGather( dl, keys = TRUE, names = FALSE ))
## remove DList and garbage collect it
rm( dl )
gc()



