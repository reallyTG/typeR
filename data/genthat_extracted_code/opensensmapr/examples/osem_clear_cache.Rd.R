library(opensensmapr)


### Name: osem_clear_cache
### Title: Purge cached responses from the given cache directory
### Aliases: osem_clear_cache

### ** Examples

## No test: 
  osem_boxes(cache = tempdir())
  osem_clear_cache()

  cachedir = paste(getwd(), 'osemcache', sep = '/')
  osem_boxes(cache = cachedir)
  osem_clear_cache(cachedir)
## End(No test)



