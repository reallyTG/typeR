library(dbplyr)


### Name: memdb_frame
### Title: Create a database table in temporary in-memory database.
### Aliases: memdb_frame src_memdb

### ** Examples

library(dplyr)
df <- memdb_frame(x = runif(100), y = runif(100))
df %>% arrange(x)
df %>% arrange(x) %>% show_query()



