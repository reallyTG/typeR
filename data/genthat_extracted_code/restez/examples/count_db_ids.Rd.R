library(restez)


### Name: count_db_ids
### Title: Return the number of ids
### Aliases: count_db_ids

### ** Examples

library(restez)
restez_path_set(filepath = tempdir())
demo_db_create(n = 5)
restez_connect()
(count_db_ids())

# delete demo after example
db_delete(everything = TRUE)



