## ----Try it out----------------------------------------------------------
library(simpleCache)
cacheDir = tempdir()
setSharedCacheDir(cacheDir)
simpleCacheShared("normSample", { rnorm(1e7, 0,1) }, recreate=TRUE)
simpleCacheShared("normSample", { rnorm(1e7, 0,1) })

## ----Clean up------------------------------------------------------------
deleteCaches("normSample", force=TRUE)

