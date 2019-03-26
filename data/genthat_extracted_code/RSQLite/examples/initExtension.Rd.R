library(RSQLite)


### Name: initExtension
### Title: Add useful extension functions
### Aliases: initExtension

### ** Examples

library(DBI)
db <- RSQLite::datasetsDb()
RSQLite::initExtension(db)

dbGetQuery(db, "SELECT stdev(mpg) FROM mtcars")
sd(mtcars$mpg)
dbDisconnect(db)



