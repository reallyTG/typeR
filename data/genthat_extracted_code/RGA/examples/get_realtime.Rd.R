library(RGA)


### Name: get_realtime
### Title: Real Time Reporting API
### Aliases: get_realtime

### ** Examples

## Not run: 
##D # get token data
##D authorize()
##D # get report data
##D ga_data <- get_realtime(XXXXXXX, metrics = "rt:activeUsers",
##D                         dimensions = "rt:source,rt:medium")
##D # get active users in realtime (press Esc to abort)
##D while (TRUE) {
##D     cat("\014")
##D     print(get_realtime(XXXXXXX, metrics = "rt:activeUsers"))
##D     Sys.sleep(2)
##D }
## End(Not run)




