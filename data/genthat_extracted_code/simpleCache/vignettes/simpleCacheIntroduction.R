## ----Try it out----------------------------------------------------------
library(simpleCache)
cacheDir = tempdir()
setCacheDir(cacheDir)
simpleCache("normSamp", { rnorm(1e7, 0,1) })

## ------------------------------------------------------------------------
simpleCache("normSamp", { rnorm(1e7, 0,1) })

## ------------------------------------------------------------------------
normSamp = NA  # Oops broke my object in memory.
# Regular call won't reload because we have an object called normSamp already:
simpleCache("normSamp", { rnorm(1e7, 0,1) })
# But we can force reload and get it back with reload=TRUE
simpleCache("normSamp", { rnorm(1e7, 0,1) }, reload=TRUE)

## ------------------------------------------------------------------------
simpleCache("normSamp", { rnorm(1e7, 0,1) }, recreate=TRUE)

## ------------------------------------------------------------------------
simpleCache("normSamp", { rnorm(1e7, 0,1) }, assignTo="mySamp")

## ------------------------------------------------------------------------
identical(normSamp, mySamp)

## ------------------------------------------------------------------------
for (i in 1:5) {
	cacheName = paste0("normSamp_", i)
	simpleCache(cacheName, { rnorm(1e6, 0,1) }, recreate=TRUE, noload=TRUE)
}

## ------------------------------------------------------------------------
overallMinimum = 1e6  # pick some high number to start
for (i in 1:5) {
	cacheName = paste0("normSamp_", i)
	simpleCache(cacheName, assignTo="temp")
	overallMinimum = min(overallMinimum, temp)
}

message(overallMinimum)

## ------------------------------------------------------------------------
loadCaches(paste0("normSamp_", 1:5))

## ------------------------------------------------------------------------
simpleCache("normSamp")

## ------------------------------------------------------------------------
simpleCache("normSamp", { rnorm(1e6, 0,1) }, recreate=TRUE, timer=TRUE)

## ------------------------------------------------------------------------
simpleCache("tResult", { 
	dat2 = rnorm(1e5, 0.05,2)
	t.test(normSamp, dat2)
	}, recreate=TRUE)

tResult
tResult$p.value

## ----Clean up------------------------------------------------------------
deleteCaches("normSamp", force=TRUE)
deleteCaches(paste0("normSamp_", 1:5), force=TRUE)
deleteCaches("tResult", force=TRUE)

