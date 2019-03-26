library(bit64)


### Name: cache
### Title: Atomic Caching
### Aliases: cache newcache jamcache setcache getcache remcache print.cache
###   still.identical
### Keywords: environment

### ** Examples

	x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
	y <- x
	still.identical(x,y)
	y[1] <- NA
	still.identical(x,y)
	mycache <- newcache(x)
	ls(mycache)
	mycache
	rm(mycache)
	jamcache(x)
	cache(x)
	x[1] <- NA
	cache(x)
	getcache(x, "abc")
	setcache(x, "abc", 1)
	getcache(x, "abc")
	remcache(x)
	cache(x)



