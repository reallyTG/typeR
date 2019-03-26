library(RGA)


### Name: RGA-package
### Title: A Google Analytics API client for R
### Aliases: RGA RGA-package rga
### Keywords: package

### ** Examples

## Not run: 
##D # load package
##D library(RGA)
##D # get access token
##D authorize()
##D # get a GA profiles
##D ga_profiles <- list_profiles()
##D # choose the profile ID by site URL
##D id <- ga_profiles[grep("http://example.com", ga_profiles$website.url), "id"]
##D # get date when GA tracking began
##D first.date <- firstdate(id)
##D # get GA report data
##D ga_data <- get_ga(id, start.date = first.date, end.date = "today",
##D                   metrics = "ga:users,ga:sessions",
##D                   dimensions = "ga:userGender,ga:userAgeBracket")
## End(Not run)




