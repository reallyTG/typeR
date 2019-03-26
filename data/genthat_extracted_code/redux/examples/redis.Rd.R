library(redux)


### Name: redis
### Title: Redis commands object
### Aliases: redis
### Keywords: datasets

### ** Examples

# This object creates commands in the format expected by the
# lower-level redis connection object:
redis$PING()

# For example to send two PING commands in a single transmission:
if (redux::redis_available()) {
  r <- redux::hiredis()
  r$pipeline(
    redux::redis$PING(),
    redux::redis$PING())
}



