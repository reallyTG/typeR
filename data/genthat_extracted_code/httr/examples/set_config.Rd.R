library(httr)


### Name: set_config
### Title: Set (and reset) global httr configuration.
### Aliases: set_config reset_config

### ** Examples

GET("http://google.com")
set_config(verbose())
GET("http://google.com")
reset_config()
GET("http://google.com")



