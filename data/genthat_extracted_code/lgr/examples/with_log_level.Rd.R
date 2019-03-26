library(lgr)


### Name: with_log_level
### Title: Inject Values into Logging Calls
### Aliases: with_log_level with_log_value

### ** Examples

with_log_level("warn", {
  lgr$info("More important than it seems")
  FATAL("Really not so bad")
})

with_log_value(
  list(msg = "overriden msg"),  {
  lgr$info("bar")
  INFO("FOO")
})



