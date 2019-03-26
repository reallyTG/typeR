library(storr)


### Name: storr_environment
### Title: Environment object cache driver
### Aliases: storr_environment driver_environment

### ** Examples


# Create an environment and stick some random numbers into it:
st <- storr_environment()
st$set("foo", runif(10))
st$get("foo")

# To make this environment persistent we can save it to disk:
path <- tempfile()
st2 <- st$archive_export(path)
# st2 is now a storr_rds (see ?storr_rds), and will persist across
# sessions.

# or export to a new list:
lis <- st$export(list())
lis



