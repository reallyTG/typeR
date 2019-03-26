library(urlshorteneR)


### Name: bitly_UserMetricsReferringDomains
### Title: Returns aggregate metrics about the domains referring click
###   traffic to all of the authenticated user's Bitlinks.
### Aliases: bitly_UserMetricsReferringDomains

### ** Examples

## Not run: 
##D bitly_token <- bitly_auth(key = "", secret = "")
##D bitly_UserMetricsReferringDomains(unit = "day", units = -1, limit = 100, rollup = "true")
##D bitly_UserMetricsReferringDomains(unit = "day", units = -1, limit = 100, rollup = "false")
##D bitly_UserMetricsReferringDomains(unit = "day", units = -1, limit = 100, 
##D exclude_social_networks = "false")
##D bitly_UserMetricsReferringDomains(unit = "day", units = -1, limit = 100, 
##D exclude_social_networks = "true")
## End(Not run)




