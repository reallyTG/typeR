library(etl)


### Name: etl
### Title: Initialize an 'etl' object
### Aliases: etl etl.default summary.etl is.etl print.etl

### ** Examples


# Instantiate the etl object
cars <- etl("mtcars")
str(cars)
is.etl(cars)
summary(cars)

## Not run: 
##D # connect to a PostgreSQL server
##D if (require(RPostgreSQL)) {
##D  db <- src_postgres("mtcars", user = "postgres", host = "localhost")
##D  cars <- etl("mtcars", db)
##D }
## End(Not run)

# Do it step-by-step
cars %>%
  etl_extract() %>%
  etl_transform() %>%
  etl_load()
src_tbls(cars)
cars %>%
  tbl("mtcars") %>%
  group_by(cyl) %>%
  summarize(N = n(), mean_mpg = mean(mpg))

# Do it all in one step
cars2 <- etl("mtcars")
cars2 %>%
  etl_update()
src_tbls(cars2)


# generic summary function provides information about the object
cars <- etl("mtcars")
summary(cars)
cars <- etl("mtcars")
# returns TRUE
is.etl(cars)

# returns FALSE
is.etl("hello world")
cars <- etl("mtcars") %>%
  etl_create()
cars



