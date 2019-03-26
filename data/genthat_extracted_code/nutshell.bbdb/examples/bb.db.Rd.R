library(nutshell.bbdb)


### Name: bb.db
### Title: 2008 Baseball Databank Database
### Aliases: bb.db
### Keywords: datasets

### ** Examples

library(RSQLite)
drv <- dbDriver("SQLite")
con <- dbConnect(drv, system.file("extdata","bb.db", package="nutshell.bbdb"))
dbListTables(con)




