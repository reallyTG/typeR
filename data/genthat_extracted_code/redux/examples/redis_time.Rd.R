library(redux)


### Name: redis_time
### Title: Get time from Redis
### Aliases: redis_time format_redis_time redis_time_to_r

### ** Examples

if (redux::redis_available()) {
  r <- redux::hiredis()

  # The output of Redis' TIME command is not the *most* useful
  # thing in the world:
  r$TIME()

  # We can get a slightly nicer representation like so:
  redux::redis_time(r)

  # And from that convert to an actual R time:
  redux::redis_time_to_r(redux::redis_time(r))
}



