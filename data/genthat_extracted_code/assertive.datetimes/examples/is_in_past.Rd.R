library(assertive.datetimes)


### Name: assert_all_are_after
### Title: Is the input in the past/future?
### Aliases: assert_all_are_after assert_all_are_before
###   assert_all_are_in_future assert_all_are_in_past assert_any_are_after
###   assert_any_are_before assert_any_are_in_future assert_any_are_in_past
###   is_after is_before is_in_future is_in_past

### ** Examples

x <- Sys.time() + c(-1, 100)
is_in_past(x)
is_in_future(x)

# more generally, compare against any date-time
is_before(x, as.POSIXct("9999-12-31"))
is_after(x, as.POSIXct("0001-01-01"))



