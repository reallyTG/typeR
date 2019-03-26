## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----createCache---------------------------------------------------------
# Create a cache directory
CACHE_DIR <- file.path(tempdir(), 'cache')
if ( file.exists(CACHE_DIR) == FALSE ) {
  dir.create(CACHE_DIR)
}

# Add a few files to the cache
write.csv(matrix(1,400,500), file=file.path(CACHE_DIR,'m1.csv'))
Sys.sleep(1) # wait a bit between each to give them different mtimes
write.csv(matrix(2,400,500), file=file.path(CACHE_DIR,'m2.csv'))
Sys.sleep(1)
write.csv(matrix(3,400,500), file=file.path(CACHE_DIR,'m3.csv'))
Sys.sleep(1)
write.csv(matrix(4,400,500), file=file.path(CACHE_DIR,'m4.csv'))

## ----checkCache----------------------------------------------------------
cachedFiles <- list.files(CACHE_DIR, full.names = TRUE)
infoDF <- file.info(cachedFiles)
cacheSize = (sum(infoDF$size) / 1e6) # in MB
print(list.files(CACHE_DIR))
sprintf("Cache size = %s MB", cacheSize)

## ----accessFiles, echo=TRUE----------------------------------------------
# Access two of the files, updating their atime
invisible( read.csv(file.path(CACHE_DIR, 'm1.csv')) )
invisible( read.csv(file.path(CACHE_DIR, 'm2.csv')) )

## ----manageCache---------------------------------------------------------
# Use manageCache() to get cache to 1 MB
library(MazamaCoreUtils)
manageCache(CACHE_DIR, extensions = 'csv', maxCacheSize = 1)

## ----checkCacheAgain-----------------------------------------------------
# Check cache contents and total size again
cachedFiles <- list.files(CACHE_DIR, full.names = TRUE)
infoDF <- file.info(cachedFiles)
cacheSize = (sum(infoDF$size) / 1e6) # in MB
print(list.files(CACHE_DIR))
sprintf("Cache size = %s MB", cacheSize)

