library(etl)


### Name: etl_cleanup
### Title: ETL functions for working with medium sized data
### Aliases: etl_cleanup etl_cleanup.default etl_create etl_create.default
###   etl_update etl_update.default etl_extract etl_extract.default
###   etl_extract.etl_mtcars etl_extract.etl_cities etl_load
###   etl_load.default etl_transform etl_transform.default
###   etl_transform.etl_mtcars etl_transform.etl_cities

### ** Examples


## Not run: 
##D if (require(RPostgreSQL)) {
##D   db <- src_postgres(dbname = "mtcars", user = "postgres", host = "localhost")
##D   cars <- etl("mtcars", db)
##D }
##D if (require(RMySQL) && mysqlHasDefault()) {
##D   db <- src_mysql(dbname = "mtcars", user = "r-user",
##D                   host = "localhost", password = "mypass")
##D   cars <- etl("mtcars", db)
##D }
## End(Not run)
cars <- etl("mtcars")
cars %>%
 etl_extract() %>%
 etl_transform() %>%
 etl_load() %>%
 etl_cleanup()
cars

cars %>%
 tbl(from = "mtcars") %>%
 group_by(cyl) %>%
 summarise(N = n(), mean_mpg = mean(mpg))

 # do it all in one step, and peek at the SQL creation script
 cars %>%
   etl_create(echo = TRUE)
 # specify a directory for the data
 ## Not run: 
##D  cars <- etl("mtcars", dir = "~/dumps/mtcars/")
##D  str(cars)
##D  
## End(Not run)
cars <- etl("mtcars")
# Do it step-by-step
cars %>%
  etl_extract() %>%
  etl_transform() %>%
  etl_load()

# Note the somewhat imprecise data types for the columns. These are the default.
tbl(cars, "mtcars")

# But you can also specify your own schema if you want
schema <- system.file("sql", "init.sqlite", package = "etl")
etl_load(cars, schema)



