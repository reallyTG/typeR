library(redux)


### Name: redis_info
### Title: Parse Redis INFO
### Aliases: redis_info parse_info redis_version

### ** Examples

if (redux::redis_available()) {
  r <- redux::hiredis()

  # Redis server version:
  redux::redis_version(r)
  # This is a 'numeric_version' object so you can compute with it
  # if you need to check for minimum versions
  redux::redis_version(r) >= numeric_version("2.1.1")

  # Extensive information is given back by the server:
  redux::redis_info(r)

  # Which is just:
  redux::parse_info(r$INFO())
}



