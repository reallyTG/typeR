library(RH2)


### Name: H2
### Title: H2 engine
### Aliases: H2
### Keywords: interface

### ** Examples

## Not run: 
##D library(RJDBC)
##D 
##D con <- dbConnect(H2(), "jdbc:h2:~/test", "sa", "")
##D 
##D # create table, populate it and display it
##D s <- 'create table tt("id" int primary key, "name" varchar(255))'
##D dbSendUpdate(con, s)
##D dbSendUpdate(con, "insert into tt values(1, 'Hello')")
##D dbSendUpdate(con, "insert into tt values(2, 'World')")
##D dbGetQuery(con, "select * from tt")
##D 
##D # transfer a data frame to H2 and then display it from the database
##D dbWriteTable(con, "BOD", BOD)
##D dbGetQuery(con, "select * from BOD")
##D 
##D dbDisconnect(con)
##D 
##D # connect to a different version of H2 and show version
##D con <- dbConnect(H2(jars = "c:/tmp2/h2-1.3.155.jar"))
##D s <- "select VALUE from INFORMATION_SCHEMA.SETTINGS where NAME = 'info.VERSION'"
##D dbGetQuery(con, s)
##D dbDisconnect(con)
##D 
## End(Not run)



