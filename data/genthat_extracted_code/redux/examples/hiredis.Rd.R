library(redux)


### Name: hiredis
### Title: Interface to Redis
### Aliases: hiredis redis_available

### ** Examples

# Only run if a Redis server is running
if (redux::redis_available()) {
  r <- redux::hiredis()
  r$PING()
  r$SET("foo", "bar")
  r$GET("foo")

  # There are lots of methods here:
  r
}



