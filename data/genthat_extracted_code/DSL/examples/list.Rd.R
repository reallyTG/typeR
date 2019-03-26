library(DSL)


### Name: DList
### Title: Distributed List Class
### Aliases: DList as.DList is.DList DL_storage DL_storage<-

### ** Examples

## coerce to 'DList' object using a default virtual storage
l <- list( cow = "girl", bull = "boy" )
dl <- as.DList( l )
is.DList( dl )
DL_storage(dl)
## remove DList and garbage collect it
rm(dl)
gc()



