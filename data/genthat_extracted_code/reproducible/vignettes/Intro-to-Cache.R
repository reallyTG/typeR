## ----function-level, echo=TRUE-------------------------------------------
library(raster)
library(reproducible)

tmpDir <- file.path(tempdir(), "reproducible_examples", "Cache")
checkPath(tmpDir, create = TRUE)

ras <- raster(extent(0, 1000, 0, 1000), vals = 1:1e6, res = 1)
crs(ras) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"

newCRS <- "+init=epsg:4326 +proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
# No Cache
system.time(map1 <- projectRaster(ras, crs = newCRS))

# With Cache -- a little slower the first time because saving to disk
system.time(map1 <- Cache(projectRaster, ras, crs = newCRS, cacheRepo = tmpDir,
                         notOlderThan = Sys.time()))

# vastly faster the second time
system.time(map2 <- Cache(projectRaster, ras, crs = newCRS, cacheRepo = tmpDir))

# even faster the third time
system.time(map3 <- Cache(projectRaster, ras, crs = newCRS, cacheRepo = tmpDir))

all.equal(map1, map2) # TRUE
all.equal(map1, map3) # TRUE

## ------------------------------------------------------------------------
library(raster)
library(magrittr)

try(clearCache(tmpDir, ask = FALSE), silent = TRUE) # just to make sure it is clear

ranNumsA <- Cache(rnorm, 10, 16, cacheRepo = tmpDir)

# All same
ranNumsB <- Cache(rnorm, 10, 16, cacheRepo = tmpDir) # recovers cached copy
ranNumsC <- Cache(cacheRepo = tmpDir) %C% rnorm(10, 16)  # recovers cached copy
ranNumsD <- Cache(quote(rnorm(n = 10, 16)), cacheRepo = tmpDir) # recovers cached copy

# Any minor change makes it different
ranNumsE <- Cache(cacheRepo = tmpDir) %C% rnorm(10, 6) # different

## ----tags----------------------------------------------------------------
ranNumsA <- Cache(rnorm, 4, cacheRepo = tmpDir, userTags = "objectName:a")
ranNumsB <- Cache(runif, 4, cacheRepo = tmpDir, userTags = "objectName:b")

showCache(tmpDir, userTags = c("objectName"))
showCache(tmpDir, userTags = c("^a$")) # regular expression ... "a" exactly
showCache(tmpDir, userTags = c("runif")) # show only cached objects made during runif call

clearCache(tmpDir, userTags = c("runif"), ask = FALSE) # remove only cached objects made during runif call
showCache(tmpDir) # only those made during rnorm call

clearCache(tmpDir, ask = FALSE)

## ----accessed-tag--------------------------------------------------------
ranNumsA <- Cache(rnorm, 4, cacheRepo = tmpDir, userTags = "objectName:a")
ranNumsB <- Cache(runif, 4, cacheRepo = tmpDir, userTags = "objectName:b")

# access it again, from Cache
ranNumsA <- Cache(rnorm, 4, cacheRepo = tmpDir, userTags = "objectName:a")
wholeCache <- showCache(tmpDir)

# keep only items accessed "recently" (i.e., only objectName:a)
onlyRecentlyAccessed <- showCache(tmpDir, userTags = max(wholeCache[tagKey == "accessed"]$tagValue))

# inverse join with 2 data.tables ... using: a[!b]
# i.e., return all of wholeCache that was not recently accessed
toRemove <- unique(wholeCache[!onlyRecentlyAccessed], by = "artifact")$artifact
clearCache(tmpDir, toRemove, ask = FALSE) # remove ones not recently accessed
showCache(tmpDir) # still has more recently accessed

clearCache(tmpDir, ask = FALSE)


## ----keepCache-----------------------------------------------------------
ranNumsA <- Cache(rnorm, 4, cacheRepo = tmpDir, userTags = "objectName:a")
ranNumsB <- Cache(runif, 4, cacheRepo = tmpDir, userTags = "objectName:b")

# keep only those cached items from the last 24 hours
oneDay <- 60 * 60 * 24
keepCache(tmpDir, after = Sys.time() - oneDay, ask = FALSE)

# Keep all Cache items created with an rnorm() call
keepCache(tmpDir, userTags = "rnorm", ask = FALSE)

# Remove all Cache items that happened within a rnorm() call
clearCache(tmpDir, userTags = "rnorm", ask = FALSE)

showCache(tmpDir) ## empty

## ----searching-within-cache----------------------------------------------
# default userTags is "and" matching; for "or" matching use |
ranNumsA <- Cache(runif, 4, cacheRepo = tmpDir, userTags = "objectName:a")
ranNumsB <- Cache(rnorm, 4, cacheRepo = tmpDir, userTags = "objectName:b")

# show all objects (runif and rnorm in this case)
showCache(tmpDir)

# show objects that are both runif and rnorm
# (i.e., none in this case, because objecs are either or, not both)
showCache(tmpDir, userTags = c("runif", "rnorm")) ## empty

# show objects that are either runif or rnorm ("or" search)
showCache(tmpDir, userTags = "runif|rnorm")

# keep only objects that are either runif or rnorm ("or" search)
keepCache(tmpDir, userTags = "runif|rnorm", ask = FALSE)

clearCache(tmpDir, ask = FALSE)

## ----expensive-computations----------------------------------------------
ras <- raster(extent(0, 5, 0, 5), res = 1,
              vals = sample(1:5, replace = TRUE, size = 25),
              crs = "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84")

# A slow operation, like GIS operation
notCached <- suppressWarnings(
  # project raster generates warnings when run non-interactively
  projectRaster(ras, crs = crs(ras), res = 5, cacheRepo = tmpDir)
)

cached <- suppressWarnings(
  # project raster generates warnings when run non-interactively
  # using quote works also
  Cache(projectRaster, ras, crs = crs(ras), res = 5, cacheRepo = tmpDir)
)

# second time is much faster
reRun <- suppressWarnings(
  # project raster generates warnings when run non-interactively
  Cache(projectRaster, ras, crs = crs(ras), res = 5, cacheRepo = tmpDir)
)

# recovered cached version is same as non-cached version
all.equal(notCached, reRun) ## TRUE

## ----nested--------------------------------------------------------------
##########################
## Nested Caching
# Make 2 functions
inner <- function(mean) {
  d <- 1
  Cache(rnorm, n = 3, mean = mean)
}
outer <- function(n) {
  Cache(inner, 0.1, cacheRepo = tmpdir2)
}

# make 2 different cache paths
tmpdir1 <- file.path(tempdir(), "first")
tmpdir2 <- file.path(tempdir(), "second")

# Run the Cache ... notOlderThan propagates to all 3 Cache calls,
#   but cacheRepo is tmpdir1 in top level Cache and all nested
#   Cache calls, unless individually overridden ... here inner
#   uses tmpdir2 repository
Cache(outer, n = 2, cacheRepo = tmpdir1, notOlderThan = Sys.time())

showCache(tmpdir1) # 2 function calls
showCache(tmpdir2) # 1 function call

# userTags get appended
# all items have the outer tag propagate, plus inner ones only have inner ones
clearCache(tmpdir1, ask = FALSE)
outerTag <- "outerTag"
innerTag <- "innerTag"
inner <- function(mean) {
  d <- 1
  Cache(rnorm, n = 3, mean = mean, notOlderThan = Sys.time() - 1e5, userTags = innerTag)
}
outer <- function(n) {
  Cache(inner, 0.1)
}
aa <- Cache(outer, n = 2, cacheRepo = tmpdir1, userTags = outerTag)
showCache(tmpdir1) # rnorm function has outerTag and innerTag, inner and outer only have outerTag


## ----selective-cacheId---------------------------------------------------
### cacheId
set.seed(1)
Cache(rnorm, 1, cacheRepo = tmpdir1)
# manually look at output attribute which shows cacheId: ad184ce64541972b50afd8e7b75f821b
Cache(rnorm, 1, cacheRepo = tmpdir1, cacheId = "ad184ce64541972b50afd8e7b75f821b") # same value
# override even with different inputs:
Cache(rnorm, 2, cacheRepo = tmpdir1, cacheId = "ad184ce64541972b50afd8e7b75f821b")

## cleanup
unlink(c("filename.rda", "filename1.rda"))

## ----manual-cache--------------------------------------------------------
if (requireNamespace("archivist")) {
  # get the RasterLayer that was produced with the gaussMap function:
  mapHash <- unique(showCache(tmpDir, userTags = "projectRaster")$artifact)
  map <- archivist::loadFromLocalRepo(md5hash = mapHash[1], repoDir = tmpDir, value = TRUE)
  
  plot(map)
}

## ----cleanup-------------------------------------------------------------
## cleanup
unlink(dirname(tmpDir), recursive = TRUE)

