library(usethis)


### Name: use_tidy_thanks
### Title: Identify contributors via GitHub activity
### Aliases: use_tidy_thanks

### ** Examples

## Not run: 
##D ## active project, interval = since the last release
##D use_tidy_thanks()
##D 
##D ## active project, interval = since a specific datetime
##D use_tidy_thanks(from = "2018-02-24T00:13:45Z")
##D 
##D ## r-lib/usethis, inteval = since a certain date
##D use_tidy_thanks("r-lib/usethis", from = "2018-05-01")
##D 
##D ## r-lib/usethis, up to a specific release
##D use_tidy_thanks("r-lib/usethis", from = NULL, to = "v1.3.0")
##D 
##D ## r-lib/usethis, since a specific commit, up to a specific date
##D use_tidy_thanks("r-lib/usethis", from = "08a560d", to = "2018-05-14")
## End(Not run)



