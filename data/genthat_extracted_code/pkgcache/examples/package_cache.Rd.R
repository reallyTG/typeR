library(pkgcache)


### Name: package_cache
### Title: A simple package cache
### Aliases: package_cache
### Keywords: datasets

### ** Examples


## Although package_cache usually stores packages, it may store
## arbitrary files, that can be search by metadata
pc <- package_cache$new(path = tempfile())
pc$list()

cat("foo\n", file = f1 <- tempfile())
cat("bar\n", file = f2 <- tempfile())
pc$add(f1, "/f1")
pc$add(f2, "/f2")
pc$list()
pc$find(path = "/f1")
pc$copy_to(target = f3 <- tempfile(), path = "/f1")
readLines(f3)



