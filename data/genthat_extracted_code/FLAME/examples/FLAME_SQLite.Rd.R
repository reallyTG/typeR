library(FLAME)


### Name: FLAME_SQLite
### Title: SQLite Database Implementation
### Aliases: FLAME_SQLite

### ** Examples

## No test: 
data <- data(toy_data)

db <- dbConnect(SQLite(),"tempdb")

FLAME_SQLite(db = db, data = data, holdout = data)

dbDisconnect(db)
## End(No test)



