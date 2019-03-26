## ---- warning=FALSE------------------------------------------------------
library(etl)
cars <- etl("mtcars")
class(cars)

## ---- eval=FALSE---------------------------------------------------------
#  # For PostgreSQL
#  library(RPostgreSQL)
#  db <- src_postgres(dbname = "mtcars", user = "postgres", host = "localhost")
#  
#  # Alternatively, for MySQL
#  library(RMySQL)
#  db <- src_mysql(dbname = "mtcars", user = "r-user", password = "mypass", host = "localhost")
#  cars <- etl("mtcars", db)

## ------------------------------------------------------------------------
cars %>%
  etl_extract()

## ------------------------------------------------------------------------
cars %>%
  etl_transform()

## ------------------------------------------------------------------------
cars %>%
  etl_load()

## ------------------------------------------------------------------------
cars %>%
  etl_create()

## ---- eval=FALSE---------------------------------------------------------
#  cars %>%
#    etl_update()

## ------------------------------------------------------------------------
getS3method("etl_update", "default")

## ------------------------------------------------------------------------
getS3method("etl_create", "default")

## ------------------------------------------------------------------------
cars %>%
  tbl("mtcars") %>%
  group_by(cyl) %>%
  summarise(N = n(), mean_mpg = mean(mpg))

## ---- eval=FALSE---------------------------------------------------------
#  etl_extract.etl_pkgname()
#  etl_load.etl_pkgname()

## ---- eval=FALSE---------------------------------------------------------
#  etl_transform.etl_pkgname()
#  etl_cleanup.etl_pkgname()

## ------------------------------------------------------------------------
tools::dependsOnPkgs("etl")

