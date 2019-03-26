library(filehash)


### Name: dbLoad
### Title: Load database into environment
### Aliases: dbLoad dbLoad,filehash-method dbLazyLoad
###   dbLazyLoad,filehash-method db2env
### Keywords: database

### ** Examples

dbCreate("myDB")
db <- dbInit("myDB")
dbInsert(db, "a", rnorm(100))
dbInsert(db, "b", 1:10)

env <- db2env(db)
ls(env)  ## "a", "b"
print(env$b)
mean(env$a)
env$a <- rnorm(100)
mean(env$a)

env$b[1:5] <- 5:1
print(env$b)

env <- new.env()
dbLoad(db, env)
ls(env)

env <- new.env()
dbLazyLoad(db, env)
ls(env)

as(db, "list")



