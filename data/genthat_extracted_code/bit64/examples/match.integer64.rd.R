library(bit64)


### Name: match.integer64
### Title: 64-bit integer matching
### Aliases: match.integer64 %in%.integer64
### Keywords: manip logic

### ** Examples

x <- as.integer64(c(NA, 0:9), 32)
table <- as.integer64(c(1:9, NA))
match.integer64(x, table)
"%in%.integer64"(x, table)

x <- as.integer64(sample(c(rep(NA, 9), 0:9), 32, TRUE))
table <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
stopifnot(identical(match.integer64(x, table), match(as.integer(x), as.integer(table))))
stopifnot(identical("%in%.integer64"(x, table), as.integer(x) %in% as.integer(table)))

## Not run: 
##D 	message("check when reverse hash-lookup beats standard hash-lookup")
##D 	e <- 4:24
##D 	timx <- timy <- matrix(NA, length(e), length(e), dimnames=list(e,e))
##D 	for (iy in seq_along(e))
##D 	for (ix in 1:iy){
##D 		nx <- 2^e[ix]
##D 		ny <- 2^e[iy]
##D 		x <- as.integer64(sample(ny, nx, FALSE))
##D 		y <- as.integer64(sample(ny, ny, FALSE))
##D 		#hashfun(x, bits=as.integer(5))
##D 		timx[ix,iy] <- repeat.time({
##D 		hx <- hashmap(x)
##D 		py <- hashrev(hx, y)
##D 		})[3]
##D 		timy[ix,iy] <- repeat.time({
##D 		hy <- hashmap(y)
##D 		px <- hashpos(hy, x)
##D 		})[3]
##D 		#identical(px, py)
##D 		print(round(timx[1:iy,1:iy]/timy[1:iy,1:iy], 2), na.print="")
##D 	}
##D 
##D 	message("explore best low-level method given size of x and table")
##D 	B1 <- 1:27
##D 	B2 <- 1:27
##D 	tim <- array(NA, dim=c(length(B1), length(B2), 5)
##D  , dimnames=list(B1, B2, c("hashpos","hashrev","sortpos1","sortpos2","sortpos3")))
##D 	for (i1 in B1)
##D 	for (i2 in B2)
##D 	{
##D 	  b1 <- B1[i1]
##D 	  b2 <- B1[i2]
##D 	  n1 <- 2^b1
##D 	  n2 <- 2^b2
##D 	  x1 <- as.integer64(c(sample(n2, n1-1, TRUE), NA))
##D 	  x2 <- as.integer64(c(sample(n2, n2-1, TRUE), NA))
##D 	  tim[i1,i2,1] <- repeat.time({h <- hashmap(x2);hashpos(h, x1);rm(h)})[3]
##D 	  tim[i1,i2,2] <- repeat.time({h <- hashmap(x1);hashrev(h, x2);rm(h)})[3]
##D 	  s <- clone(x2); o <- seq_along(s); ramsortorder(s, o)
##D 	  tim[i1,i2,3] <- repeat.time(sortorderpos(s, o, x1, method=1))[3]
##D 	  tim[i1,i2,4] <- repeat.time(sortorderpos(s, o, x1, method=2))[3]
##D 	  tim[i1,i2,5] <- repeat.time(sortorderpos(s, o, x1, method=3))[3]
##D 	  rm(s,o)
##D 	  print(apply(tim, 1:2, function(ti)if(any(is.na(ti)))NA else which.min(ti)))
##D 	}
## End(Not run)



