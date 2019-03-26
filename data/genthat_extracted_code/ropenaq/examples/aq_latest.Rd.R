library(ropenaq)


### Name: aq_latest
### Title: Provides the latest value of each available parameter for every
###   location in the system.
### Aliases: aq_latest

### ** Examples

## Not run: 
##D latest_chennai <- aq_latest(country='IN', city='Chennai')
##D latest_chennai
##D attr(latest_chennai, "meta")
##D attr(latest_chennai, "timestamp")
##D aq_latest(parameter='co')
## End(Not run)



