library(storr)


### Name: storr_rds
### Title: rds object cache driver
### Aliases: storr_rds driver_rds

### ** Examples


# Create an rds storr in R's temporary directory:
st <- storr_rds(tempfile())

# Store some data (10 random numbers against the key "foo")
st$set("foo", runif(10))
st$list()

# And retrieve the data:
st$get("foo")

# Keys that are not valid filenames will cause issues.  This will
# cause an error:
## Not run: 
##D st$set("foo/bar", letters)
## End(Not run)

# The solution to this is to "mangle" the key names.  Storr can do
# this for you:
st2 <- storr_rds(tempfile(), mangle_key = TRUE)
st2$set("foo/bar", letters)
st2$list()
st2$get("foo/bar")

# Behind the scenes, storr is safely encoding the filenames with base64:
dir(file.path(st2$driver$path, "keys", "objects"))

# Clean up the two storrs:
st$destroy()
st2$destroy()



