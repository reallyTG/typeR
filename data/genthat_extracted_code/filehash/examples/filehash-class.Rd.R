library(filehash)


### Name: filehash-class
### Title: Class "filehash"
### Aliases: filehash-class filehashDB-class filehashRDS-class
###   filehashDB1-class dbFetch dbMultiFetch dbInsert dbExists dbList
###   dbDelete dbReorganize dbUnlink dbDelete,filehashDB,character-method
###   dbExists,filehashDB,character-method
###   dbFetch,filehashDB,character-method
###   dbInsert,filehashDB,character-method dbList,filehashDB-method
###   dbUnlink,filehashDB-method dbReorganize,filehashDB-method
###   dbMultiFetch,filehashDB1-method dbDelete,filehashDB1,character-method
###   dbExists,filehashDB1,character-method
###   dbFetch,filehashDB1,character-method
###   dbMultiFetch,filehashDB1,character-method
###   dbInsert,filehashDB1,character-method dbList,filehashDB1-method
###   dbUnlink,filehashDB1-method dbReorganize,filehashDB1-method
###   dbDelete,filehashRDS,character-method
###   dbExists,filehashRDS,character-method
###   dbFetch,filehashRDS,character-method
###   dbMultiFetch,filehashRDS,character-method
###   dbInsert,filehashRDS,character-method dbList,filehashRDS-method
###   dbUnlink,filehashRDS-method show,filehash-method with,filehash-method
###   coerce,filehashDB,filehashRDS-method
###   coerce,filehashRDS,filehashDB-method
###   coerce,filehashDB1,filehashRDS-method coerce,filehashDB1,list-method
###   coerce,filehashDB,filehashDB1-method coerce,filehash,list-method
###   lapply,filehash-method names,filehash-method length,filehash-method
###   [,filehash,character,missing,missing-method
###   [[,filehash,character,missing-method
###   [[,filehash,numeric,missing-method
###   [[<-,filehash,character,missing-method
###   [[<-,filehash,numeric,missing-method $<-,filehash-method
###   $,filehash-method
### Keywords: classes

### ** Examples

dbCreate("myDB")  ## Create database 'myDB'
db <- dbInit("myDB")
dbInsert(db, "a", 1:10)
dbInsert(db, "b", rnorm(1000))
dbExists(db, "b")  ## 'TRUE'

dbList(db)  ## c("a", "b")
dbDelete(db, "a")
dbList(db) ## "b"

with(db, mean(b))



