library(httr)


### Name: with_config
### Title: Execute code with configuration set.
### Aliases: with_config with_verbose

### ** Examples

with_config(verbose(), {
  GET("http://had.co.nz")
  GET("http://google.com")
})

# Or even easier:
with_verbose(GET("http://google.com"))



