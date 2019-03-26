library(fredr)


### Name: fredr_release
### Title: Get a release of economic data
### Aliases: fredr_release

### ** Examples

## No test: 
# Release as of today
fredr_release(release_id = 20)

# For some releases, adding realtime dates returns the history of changes
# the release went through
fredr_release(9, realtime_start = as.Date("1950-01-01"))
## End(No test)



