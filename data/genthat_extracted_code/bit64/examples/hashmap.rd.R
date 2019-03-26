library(bit64)


### Name: hashmap
### Title: Hashing for 64bit integers
### Aliases: hashfun hashfun.integer64 hashmap hashmap.integer64 hashpos
###   hashpos.cache_integer64 hashrev hashrev.cache_integer64 hashfin
###   hashfin.cache_integer64 hashrin hashrin.cache_integer64 hashdup
###   hashdup.cache_integer64 hashuni hashuni.cache_integer64 hashmapuni
###   hashmapuni.integer64 hashupo hashupo.cache_integer64 hashmapupo
###   hashmapupo.integer64 hashtab hashtab.cache_integer64 hashmaptab
###   hashmaptab.integer64
### Keywords: programming manip

### ** Examples

x <- as.integer64(sample(c(NA, 0:9)))
y <- as.integer64(sample(c(NA, 1:9), 10, TRUE))
hashfun(y)
hx <- hashmap(x)
hy <- hashmap(y)
ls(hy)
hashpos(hy, x)
hashrev(hx, y)
hashfin(hy, x)
hashrin(hx, y)
hashdup(hy)
hashuni(hy)
hashuni(hy, keep.order=TRUE)
hashmapuni(y)
hashupo(hy)
hashupo(hy, keep.order=TRUE)
hashmapupo(y)
hashtab(hy)
hashmaptab(y)

stopifnot(identical(match(as.integer(x),as.integer(y)),hashpos(hy, x)))
stopifnot(identical(match(as.integer(x),as.integer(y)),hashrev(hx, y)))
stopifnot(identical(as.integer(x) %in% as.integer(y), hashfin(hy, x)))
stopifnot(identical(as.integer(x) %in% as.integer(y), hashrin(hx, y)))
stopifnot(identical(duplicated(as.integer(y)), hashdup(hy)))
stopifnot(identical(as.integer64(unique(as.integer(y))), hashuni(hy, keep.order=TRUE)))
stopifnot(identical(sort(hashuni(hy, keep.order=FALSE)), sort(hashuni(hy, keep.order=TRUE))))
stopifnot(identical(y[hashupo(hy, keep.order=FALSE)], hashuni(hy, keep.order=FALSE)))
stopifnot(identical(y[hashupo(hy, keep.order=TRUE)], hashuni(hy, keep.order=TRUE)))
stopifnot(identical(hashpos(hy, hashuni(hy, keep.order=TRUE)), hashupo(hy, keep.order=TRUE)))
stopifnot(identical(hashpos(hy, hashuni(hy, keep.order=FALSE)), hashupo(hy, keep.order=FALSE)))
stopifnot(identical(hashuni(hy, keep.order=FALSE), hashtab(hy)$values))
stopifnot(identical(as.vector(table(as.integer(y), useNA="ifany"))
, hashtab(hy)$counts[order.integer64(hashtab(hy)$values)]))
stopifnot(identical(hashuni(hy, keep.order=TRUE), hashmapuni(y)))
stopifnot(identical(hashupo(hy, keep.order=TRUE), hashmapupo(y)))
stopifnot(identical(hashtab(hy), hashmaptab(y)))

	## Not run: 
##D 	message("explore speed given size of the hasmap in 2^hashbits and size of the data")
##D 	message("more hashbits means more random access and less collisions")
##D 	message("i.e. more data means less random access and more collisions")
##D 	bits <- 24
##D 	b <- seq(-1, 0, 0.1)
##D 	tim <- matrix(NA, length(b), 2, dimnames=list(b, c("bits","bits+1")))
##D     for (i in 1:length(b)){
##D 	  n <- as.integer(2^(bits+b[i]))
##D 	  x <- as.integer64(sample(n))
##D 	  tim[i,1] <- repeat.time(hashmap(x, hashbits=bits))[3]
##D 	  tim[i,2] <- repeat.time(hashmap(x, hashbits=bits+1))[3]
##D 	  print(tim)
##D       matplot(b, tim)
##D 	}
##D 	message("we conclude that n*sqrt(2) is enough to avoid collisions")
##D 	
## End(Not run)



