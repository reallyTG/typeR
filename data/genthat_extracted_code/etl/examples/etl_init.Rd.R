library(etl)


### Name: etl_init
### Title: Initialize a database using a defined schema
### Aliases: etl_init etl_init.default find_schema

### ** Examples

cars <- etl("mtcars")
cars %>%
  etl_init()
cars %>%
  etl_init(script = sql("CREATE TABLE IF NOT EXISTS mtcars_alt (id INTEGER);"))
cars %>%
  etl_init(schema_name = "init")
init_script <- find_schema(cars, schema_name = "init")
cars %>%
  etl_init(script = init_script, echo = TRUE)
src_tbls(cars)

cars <- etl("mtcars")
find_schema(cars)
find_schema(cars, "init", "etl")
find_schema(cars, "my_crazy_schema", "etl")




