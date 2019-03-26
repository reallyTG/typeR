library(FLAME)


### Name: FLAME_PostgreSQL
### Title: PostgreSQL Database Implementation
### Aliases: FLAME_PostgreSQL

### ** Examples

## No test: 
data <- data(toy_data)

drv <- dbDriver('PostgreSQL')

db <- dbConnect(drv, dbname="FLAME", host='localhost',
port=5432, user="postgres", password = 'new_password')

FLAME_PostgreSQL(db = db, data = data, holdout = data)

dbDisconnect(db)
## End(No test)



