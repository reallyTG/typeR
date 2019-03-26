library(redux)


### Name: from_redis_hash
### Title: Convert Redis hash
### Aliases: from_redis_hash

### ** Examples

if (redux::redis_available()) {
  # Using a random key so we don't overwrite anything in your database:
  key <- paste0("redux::", paste(sample(letters, 15), collapse = ""))
  r <- redux::hiredis()
  r$HSET(key, "a", "apple")
  r$HSET(key, "b", "banana")
  r$HSET(key, "c", "carrot")

  # Now we have a hash with three elements:
  r$HGETALL(key)

  # Ew, that's not very nice.  This is nicer:
  redux::from_redis_hash(r, key)

  # If one of the elements was not a string, then that would not
  # have worked, but you can always leave as a list:
  redux::from_redis_hash(r, key, f = identity)

  # To get just some elements:
  redux::from_redis_hash(r, key, c("a", "c"))

  # And if some are not present:
  redux::from_redis_hash(r, key, c("a", "x"))
  redux::from_redis_hash(r, key, c("a", "z"), missing = "zebra")

  r$DEL(key)
}



