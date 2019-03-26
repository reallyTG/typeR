library(dbplyr)


### Name: testing
### Title: Infrastructure for testing dplyr
### Aliases: testing test_register_src test_register_con src_test test_load
###   test_frame
### Keywords: internal

### ** Examples

## Not run: 
##D test_register_src("df", src_df(env = new.env()))
##D test_register_src("sqlite", src_sqlite(":memory:", create = TRUE))
##D 
##D test_frame(x = 1:3, y = 3:1)
##D test_load(mtcars)
## End(Not run)



