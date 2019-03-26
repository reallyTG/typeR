library(mapmisc)


### Name: persistentCache
### Title: Set a persistent cache
### Aliases: persistentCache mapmiscCache mapmiscCachePath

### ** Examples

# current cache
getOption("mapmiscCachePath")

# set a new cache
myCache = file.path(tempdir(), 'myCache')
dir.create(myCache)
options(mapmiscCachePath = myCache)
getOption("mapmiscCachePath")

# create a persistent cache
## Not run: 
##D persistentCache(verbose=TRUE)
## End(Not run)
getOption("mapmiscCachePath")



