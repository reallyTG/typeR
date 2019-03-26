library(assertive.types)


### Name: assert_is_date
### Title: Is the input a date?
### Aliases: assert_is_date assert_is_posixct assert_is_posixlt is_date
###   is_posixct is_posixlt

### ** Examples

is_date(Sys.Date())
is_posixct(Sys.time())

# These examples should fail.
assertive.base::dont_stop(assert_is_date(Sys.time()))



