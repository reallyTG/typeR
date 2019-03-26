library(brew)


### Name: brewCache
### Title: Caching Brew Templates
### Aliases: brewCache setBufLen brewCacheOn brewCacheOff
### Keywords: utilities

### ** Examples


## Turn on caching
brewCacheOn()

## Brew a template
brew(system.file("featurefull.brew",package="brew"),envir=new.env())

## Get the internal cache
cache <- brewCache()

## Inspect
as.list(cache)

## Inspect first file cached in list
as.list(cache)[[1]]

## Inspect environment that contains text and parsed code
as.list(as.list(cache)[[1]]$env)

## Turn off brew caching
brewCacheOff()
rm(cache)



