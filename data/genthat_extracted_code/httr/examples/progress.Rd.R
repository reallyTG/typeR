library(httr)


### Name: progress
### Title: Add a progress bar.
### Aliases: progress

### ** Examples

cap_speed <- config(max_recv_speed_large = 10000)
## No test: 
# If file size is known, you get a progress bar:
x <- GET("http://httpbin.org/bytes/102400", progress(), cap_speed)
# Otherwise you get the number of bytes downloaded:
x <- GET("http://httpbin.org/stream-bytes/102400", progress(), cap_speed)
## End(No test)



