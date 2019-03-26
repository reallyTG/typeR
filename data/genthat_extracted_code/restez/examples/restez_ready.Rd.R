library(restez)


### Name: restez_ready
### Title: Is restez ready?
### Aliases: restez_ready

### ** Examples

library(restez)
fp <- tempdir()
restez_path_set(filepath = fp)
demo_db_create(n = 5)
restez_connect()
(restez_ready())
restez_disconnect()
db_delete(everything = TRUE)
(restez_ready())



