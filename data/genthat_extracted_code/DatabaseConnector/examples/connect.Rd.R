library(DatabaseConnector)


### Name: connect
### Title: connect
### Aliases: connect

### ** Examples

## Not run: 
##D conn <- connect(dbms = "postgresql",
##D                 server = "localhost/postgres",
##D                 user = "root",
##D                 password = "xxx",
##D                 schema = "cdm_v4")
##D dbGetQuery(conn, "SELECT COUNT(*) FROM person")
##D disconnect(conn)
##D 
##D conn <- connect(dbms = "sql server", server = "RNDUSRDHIT06.jnj.com", schema = "Vocabulary")
##D dbGetQuery(conn, "SELECT COUNT(*) FROM concept")
##D disconnect(conn)
##D 
##D conn <- connect(dbms = "oracle",
##D                 server = "127.0.0.1/xe",
##D                 user = "system",
##D                 password = "xxx",
##D                 schema = "test",
##D                 pathToDriver = "c:/temp")
##D dbGetQuery(conn, "SELECT COUNT(*) FROM test_table")
##D disconnect(conn)
##D 
##D conn <- connect(dbms = "postgresql",
##D                 connectionString = "jdbc:postgresql://127.0.0.1:5432/cmd_database")
##D dbGetQuery(conn, "SELECT COUNT(*) FROM person")
##D disconnect(conn)
##D 
## End(Not run)



