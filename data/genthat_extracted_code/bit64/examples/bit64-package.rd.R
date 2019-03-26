library(bit64)


### Name: bit64-package
### Title: A S3 class for vectors of 64bit integers
### Aliases: bit64-package bit64 integer64 is.integer64
###   is.integer.integer64 is.vector.integer64 length<-.integer64
###   print.integer64 str.integer64
### Keywords: package classes manip

### ** Examples

message("Using integer64 in vector")
x <- integer64(8)    # create 64 bit vector
x
is.atomic(x)         # TRUE
is.integer64(x)      # TRUE
is.numeric(x)        # TRUE
is.integer(x)        # FALSE - debatable
is.double(x)         # FALSE - might change
x[] <- 1:2           # assigned value is recycled as usual
x[1:6]               # subscripting as usual
length(x) <- 13      # changing length as usual
x
rep(x, 2)            # replicate as usual
seq(as.integer64(1), 10)     # seq.integer64 is dispatched on first given argument
seq(to=as.integer64(10), 1)  # seq.integer64 is dispatched on first given argument
seq.integer64(along.with=x)  # or call seq.integer64 directly
# c.integer64 is dispatched only if *first* argument is integer64 ...
x <- c(x,runif(length(x), max=100)) 
# ... and coerces everything to integer64 - including double
x                                   
names(x) <- letters  # use names as usual
x

message("Using integer64 in array - note that 'matrix' currently does not work")
message("as.vector.integer64 removed as requested by the CRAN maintainer")
message("as consequence 'array' also does not work anymore")
message("we still can create a matrix or array by assigning 'dim'")
y <- rep(as.integer64(NA), 12)
dim(y) <- c(3,4)
dimnames(y) <- list(letters[1:3], LETTERS[1:4])
y["a",] <- 1:2       # assigning as usual
y
y[1:2,-4]            # subscripting as usual
# cbind.integer64 dispatched on any argument and coerces everything to integer64
cbind(E=1:3, F=runif(3, 0, 100), G=c("-1","0","1"), y)

message("Using integer64 in data.frame")
str(as.data.frame(x))
str(as.data.frame(y))
str(data.frame(y))
str(data.frame(I(y)))
d <- data.frame(x=x, y=runif(length(x), 0, 100))
d
d$x

message("Using integer64 with csv files")
fi64 <- tempfile()
write.csv(d, file=fi64, row.names=FALSE)
e <- read.csv(fi64, colClasses=c("integer64", NA))
unlink(fi64)
str(e)
identical.integer64(d$x,e$x)

message("Serializing and unserializing integer64")
dput(d, fi64)
e <- dget(fi64)
identical.integer64(d$x,e$x)
e <- d[,]
save(e, file=fi64)
rm(e)
load(file=fi64)
identical.integer64(d,e)

### A couple of unit tests follow hidden in a dontshow{} directive ###
  ## Don't show: 
message("Testing identical.integer64")
i64 <- as.double(NA); class(i64) <- "integer64"
stopifnot(identical(unclass(i64-1), unclass(i64+1)))
stopifnot(identical(i64-1, i64+1))
stopifnot(!identical.integer64(i64-1, i64+1))

message("Testing dispatch of 'c' method")
stopifnot(identical.integer64(c(integer64(0), NA), as.integer64(NA)))
message("Dispatch on the second argument fails and we want to be notified once that changes")
stopifnot(!identical.integer64(c(NA, integer64(0)), as.integer64(NA)))

message("Testing minus and plus")
d64 <- c(-.Machine$double.base^.Machine$double.digits, -.Machine$integer.max, -1, 0, 1, .Machine$integer.max, .Machine$double.base^.Machine$double.digits)
i64 <- as.integer64(d64)
stopifnot(identical.integer64(i64-1+1,i64))
stopifnot(identical.integer64(i64+1-1,i64))

message("Testing minus and plus edge cases and 'rev'\n")
stopifnot(identical.integer64(lim.integer64()+1-1, c(lim.integer64()[1], NA)))
stopifnot(identical.integer64(rev(lim.integer64())-1+1, c(lim.integer64()[2], NA)))

message("Testing 'range.integer64', multiplication and integer division")
i64 <- integer64(63)
i64[1] <- 1
for (i in 2:63)
	i64[i] <- 2*i64[i-1]
stopifnot(identical.integer64(i64 * rev(i64), rep(i64[63], 63)))
for (i in 63:2)
	i64[i-1] <- i64[i]%/%2
stopifnot(identical.integer64(i64 * rev(i64), rep(i64[63], 63)))
for (i in 63:2)
	i64[i-1] <- i64[i]/2
stopifnot(identical.integer64(i64 * rev(i64), rep(i64[63], 63)))
stopifnot(identical.integer64(c( -i64[63] - (i64[63]-1), i64[63]+(i64[63]-1) ), lim.integer64()))

stopifnot(identical.integer64(i64[-1]%/%2*as.integer64(2), i64[-1]))
stopifnot(identical.integer64(i64[-1]%/%2L*as.integer64(2), i64[-1]))
stopifnot(identical.integer64(i64[-1]/2*as.integer64(2), i64[-1]))
stopifnot(identical.integer64(i64[-1]/2*as.integer64(2), i64[-1]))

stopifnot(identical.integer64(i64[-63]*2%/%2, i64[-63]))
stopifnot(identical.integer64(i64[-63]*2L%/%2L, i64[-63]))
stopifnot(identical.integer64(as.integer64(i64[-63]*2/2), i64[-63]))
stopifnot(identical.integer64(as.integer64(i64[-63]*2L/2L), i64[-63]))

message("Testing sqrt, power and log")
stopifnot(identical.integer64( as.integer64(sqrt(i64[-1][c(FALSE, TRUE)])*sqrt(i64[-1][c(FALSE, TRUE)])), i64[-1][c(FALSE, TRUE)] ))

stopifnot(identical.integer64(as.integer64(2)^(0:62), i64))
stopifnot(identical.integer64(as.integer64(0:62), as.integer64(round(log2(i64)))))
stopifnot(identical.integer64(as.integer64(round(log(as.integer64(2)^(0:62), 2))), as.integer64(0:62)))
stopifnot(identical.integer64(as.integer64(round(log(as.integer64(3)^(0:39), 3))), as.integer64(0:39)))
stopifnot(identical.integer64(as.integer64(round(log(as.integer64(10)^(0:18), 10))), as.integer64(0:18)))
stopifnot(identical.integer64(as.integer64(round(log10(as.integer64(10)^(0:18)))), as.integer64(0:18)))

stopifnot(identical.integer64((as.integer64(2)^(1:62))^(1/1:62), as.integer64(rep(2, 62))))
stopifnot(identical.integer64((as.integer64(3)^(1:39))^(1/1:39), as.integer64(rep(3, 39))))
stopifnot(identical.integer64((as.integer64(10)^(1:18))^(1/1:18), as.integer64(rep(10, 18))))

message("Testing c and rep")
stopifnot(identical.integer64( as.integer64(rep(1:3, 1:3)), rep(as.integer64(1:3), 1:3)))
stopifnot(identical.integer64( as.integer64(rep(1:3, 3)), rep(as.integer64(1:3), 3)))
 
x <- as.double(c(NA,NA,NA))
class(x) <- "integer64"
x <- x + -1:1
stopifnot(identical.integer64(rep(x, 3), c(x,x,x) ))
stopifnot(identical.integer64(c.integer64(list(x,x,x), recursive=TRUE), c(x,x,x) ))

message("Testing seq")
stopifnot(identical.integer64(seq(as.integer64(1), 10, 2), as.integer64(seq(1, 10, 2)) ))
stopifnot(identical.integer64(seq(as.integer64(1), by=2, length.out=5), as.integer64(seq(1, by=2, length.out=5)) ))
stopifnot(identical.integer64(seq(as.integer64(1), by=2, length.out=6), as.integer64(seq(1, by=2, length.out=6)) ))
stopifnot(identical.integer64(seq.integer64(along.with=3:5), as.integer64(seq(along.with=3:5)) ))
stopifnot(identical.integer64(seq(as.integer64(1), to=-9), as.integer64(seq(1, to=-9)) ))

message("Testing cbind and rbind")
stopifnot(identical.integer64( cbind(as.integer64(1:3), 1:3), {x <- rep(as.integer64(1:3), 2); dim(x)<-c(3,2);x}))
stopifnot(identical.integer64( rbind(as.integer64(1:3), 1:3), t({x <- rep(as.integer64(1:3), 2); dim(x)<-c(3,2);x})))

message("Testing coercion")
stopifnot(identical( as.double(as.integer64(c(NA, seq(0, 9, 0.25)))), as.double(as.integer(c(NA, seq(0, 9, 0.25))))))
stopifnot(identical( as.character(as.integer64(c(NA, seq(0, 9, 0.25)))), as.character(as.integer(c(NA, seq(0, 9, 0.25))))))
stopifnot(identical( as.integer(as.integer64(c(NA, seq(0, 9, 0.25)))), as.integer(c(NA, seq(0, 9, 0.25)))))
stopifnot(identical( as.logical(as.integer64(c(NA, seq(0, 9, 0.25)))), as.logical(as.integer(c(NA, seq(0, 9, 0.25))))))
stopifnot(identical( as.integer(as.integer64(c(NA, FALSE, TRUE))), as.integer(c(NA, FALSE, TRUE))))
stopifnot(identical( as.integer64(as.integer(as.integer64(-9:9))), as.integer64(-9:9)))
stopifnot(identical( as.integer64(as.double(as.integer64(-9:9))), as.integer64(-9:9)))
stopifnot(identical( as.integer64(as.character(as.integer64(-9:9))), as.integer64(-9:9)))
stopifnot(identical( as.integer64(as.character(lim.integer64())), lim.integer64()))

message("-- testing logical operators --")
stopifnot(identical.integer64(!c(NA, -1:1), !c(as.integer64(NA), -1:1)))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)&rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))&as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)|rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))|as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(xor(rep(c(NA, -1:1), 4),rep(c(NA, -1:1), rep(4, 4))), xor(as.integer64(rep(c(NA, -1:1), 4)),as.integer64(rep(c(NA, -1:1), rep(4, 4))))))

message("-- testing comparison operators --")
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)==rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))==as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)!=rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))!=as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)>rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))>as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)>=rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))>=as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)<rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))<as.integer64(rep(c(NA, -1:1), rep(4, 4)))))
stopifnot(identical.integer64(rep(c(NA, -1:1), 4)<=rep(c(NA, -1:1), rep(4, 4)), as.integer64(rep(c(NA, -1:1), 4))<=as.integer64(rep(c(NA, -1:1), rep(4, 4)))))

message("-- testing vector functions --")
stopifnot(identical.integer64( is.na(as.integer64(c(NA, -1:1))), is.na(c(NA, -1:1)) ))
stopifnot(identical.integer64( format(as.integer64(c(NA, -1:1))), format(c(NA, -1:1)) ))
stopifnot(identical.integer64( abs(as.integer64(c(NA, -1:1))), as.integer64(abs(c(NA, -1:1))) ))
stopifnot(identical.integer64( sign(as.integer64(c(NA, -1:1))), as.integer64(sign(c(NA, -1:1))) ))
stopifnot(identical.integer64( ceiling(as.integer64(c(NA, -1:1))), as.integer64(ceiling(c(NA, -1:1))) ))
stopifnot(identical.integer64( floor(as.integer64(c(NA, -1:1))), as.integer64(floor(c(NA, -1:1))) ))
stopifnot(identical.integer64( trunc(as.integer64(c(NA, -1:1))), as.integer64(trunc(c(NA, -1:1))) ))
stopifnot(identical.integer64( signif(as.integer64(c(NA, -1:1))), as.integer64(c(NA, -1:1)) ))

message("Testing summary functions")
stopifnot(identical(all(as.integer(1)), all(as.integer64(1))))
stopifnot(identical(all(as.integer(0)), all(as.integer64(0))))
stopifnot(identical(all(as.integer(NA)), all(as.integer64(NA))))
stopifnot(identical(all(as.integer(NA), na.rm=TRUE), all(as.integer64(NA), na.rm=TRUE)))
stopifnot(identical(all(as.integer(1), NA), all(as.integer64(1), NA)))
stopifnot(identical(all(as.integer(0), NA), all(as.integer64(0), NA)))
stopifnot(identical(all(as.integer(1), NA, na.rm=TRUE), all(as.integer64(1), NA, na.rm=TRUE)))
stopifnot(identical(all(as.integer(0), NA, na.rm=TRUE), all(as.integer64(0), NA, na.rm=TRUE)))
stopifnot(identical(all(as.integer(c(1, NA))), all(as.integer64(c(1, NA)))))
stopifnot(identical(all(as.integer(c(0, NA))), all(as.integer64(c(0, NA)))))
stopifnot(identical(all(as.integer(c(1, NA)), na.rm=TRUE), all(as.integer64(c(1, NA)), na.rm=TRUE)))
stopifnot(identical(all(as.integer(c(0, NA)), na.rm=TRUE), all(as.integer64(c(0, NA)), na.rm=TRUE)))

stopifnot(identical(any(as.integer(1)), any(as.integer64(1))))
stopifnot(identical(any(as.integer(0)), any(as.integer64(0))))
stopifnot(identical(any(as.integer(NA)), any(as.integer64(NA))))
stopifnot(identical(any(as.integer(NA), na.rm=TRUE), any(as.integer64(NA), na.rm=TRUE)))
stopifnot(identical(any(as.integer(1), NA), any(as.integer64(1), NA)))
stopifnot(identical(any(as.integer(0), NA), any(as.integer64(0), NA)))
stopifnot(identical(any(as.integer(1), NA, na.rm=TRUE), any(as.integer64(1), NA, na.rm=TRUE)))
stopifnot(identical(any(as.integer(0), NA, na.rm=TRUE), any(as.integer64(0), NA, na.rm=TRUE)))
stopifnot(identical(any(as.integer(c(1, NA))), any(as.integer64(c(1, NA)))))
stopifnot(identical(any(as.integer(c(0, NA))), any(as.integer64(c(0, NA)))))
stopifnot(identical(any(as.integer(c(1, NA)), na.rm=TRUE), any(as.integer64(c(1, NA)), na.rm=TRUE)))
stopifnot(identical(any(as.integer(c(0, NA)), na.rm=TRUE), any(as.integer64(c(0, NA)), na.rm=TRUE)))

stopifnot(identical.integer64(as.integer64(sum(c(2, 3, NA))), sum(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(sum(c(2, 3, NA), na.rm=TRUE)), sum(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(sum(c(2, 3, NA))), sum(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(sum(c(2, 3, NA), na.rm=TRUE)), sum(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(sum(2, 3, NA)), sum(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(sum(2, 3, NA, na.rm=TRUE)), sum(as.integer64(2), 3, NA, na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(sum(2, 3, NA)), sum(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(sum(2, 3, NA, na.rm=TRUE)), sum(as.integer64(2), 3, NA, na.rm=TRUE)))

stopifnot(identical.integer64(as.integer64(prod(c(2, 3, NA))), prod(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(prod(c(2, 3, NA), na.rm=TRUE)), prod(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(prod(c(2, 3, NA))), prod(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(prod(c(2, 3, NA), na.rm=TRUE)), prod(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(prod(2, 3, NA)), prod(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(prod(2, 3, NA, na.rm=TRUE)), prod(as.integer64(2), 3, NA, na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(prod(2, 3, NA)), prod(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(prod(2, 3, NA, na.rm=TRUE)), prod(as.integer64(2), 3, NA, na.rm=TRUE)))

stopifnot(identical.integer64(as.integer64(min(c(2, 3, NA))), min(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(min(c(2, 3, NA), na.rm=TRUE)), min(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(min(c(2, 3, NA))), min(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(min(c(2, 3, NA), na.rm=TRUE)), min(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(min(2, 3, NA)), min(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(min(2, 3, NA, na.rm=TRUE)), min(as.integer64(2), 3, NA, na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(min(2, 3, NA)), min(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(min(2, 3, NA, na.rm=TRUE)), min(as.integer64(2), 3, NA, na.rm=TRUE)))

stopifnot(identical.integer64(as.integer64(max(c(2, 3, NA))), max(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(max(c(2, 3, NA), na.rm=TRUE)), max(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(max(c(2, 3, NA))), max(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(max(c(2, 3, NA), na.rm=TRUE)), max(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(max(2, 3, NA)), max(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(max(2, 3, NA, na.rm=TRUE)), max(as.integer64(2), 3, NA, na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(max(2, 3, NA)), max(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(max(2, 3, NA, na.rm=TRUE)), max(as.integer64(2), 3, NA, na.rm=TRUE)))

stopifnot(identical.integer64(as.integer64(range(c(2, 3, NA))), range(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(range(c(2, 3, NA), na.rm=TRUE)), range(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(range(c(2, 3, NA))), range(as.integer64(c(2, 3, NA)))))
stopifnot(identical.integer64(as.integer64(range(c(2, 3, NA), na.rm=TRUE)), range(as.integer64(c(2, 3, NA)), na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(range(2, 3, NA)), range(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(range(2, 3, NA, na.rm=TRUE)), range(as.integer64(2), 3, NA, na.rm=TRUE)))
stopifnot(identical.integer64(as.integer64(range(2, 3, NA)), range(as.integer64(2), 3, NA)))
stopifnot(identical.integer64(as.integer64(range(2, 3, NA, na.rm=TRUE)), range(as.integer64(2), 3, NA, na.rm=TRUE)))

message("-- testing cummulative functions --")
stopifnot(identical.integer64(as.integer64(cumsum(c(2, 3, NA, 1, 4))), cumsum(as.integer64(c(2, 3, NA, 1, 4)))))
stopifnot(identical.integer64(as.integer64(cumprod(c(2, 3, NA, 1, 4))), cumprod(as.integer64(c(2, 3, NA, 1, 4)))))
stopifnot(identical.integer64(as.integer64(cummin(c(2, 3, NA, 1, 4))), cummin(as.integer64(c(2, 3, NA, 1, 4)))))
stopifnot(identical.integer64(as.integer64(cummax(c(2, 3, NA, 1, 4))), cummax(as.integer64(c(2, 3, NA, 1, 4)))))

message("testing diff")
d64 <- diffinv(rep(.Machine$integer.max, 100), lag=2, differences=2)
i64 <- as.integer64(d64)
identical(diff(d64, lag=2, differences=2), as.double(diff(i64, lag=2, differences=2)))

  
## End(Don't show)

  ## Not run: 
##D message("== Differences between integer64 and int64 ==")
##D require(bit64)
##D require(int64)
##D 
##D message("-- integer64 is atomic --")
##D is.atomic(integer64())
##D #is.atomic(int64())
##D str(integer64(3))
##D #str(int64(3))
##D 
##D message("-- The following performance numbers are measured under RWin64  --")
##D message("-- under RWin32 the advantage of integer64 over int64 is smaller --")
##D 
##D message("-- integer64 needs 7x/5x less RAM than int64 under 64/32 bit OS 
##D (and twice the RAM of integer as it should be) --")
##D #as.vector(object.size(int64(1e6))/object.size(integer64(1e6)))
##D as.vector(object.size(integer64(1e6))/object.size(integer(1e6)))
##D 
##D message("-- integer64 creates 2000x/1300x faster than int64 under 64/32 bit OS
##D (and 3x the time of integer) --")
##D t32 <- system.time(integer(1e8))
##D t64 <- system.time(integer64(1e8))
##D #T64 <- system.time(int64(1e7))*10  # using 1e8 as above stalls our R on an i7 8 GB RAM Thinkpad
##D #T64/t64
##D t64/t32
##D 
##D i32 <- sample(1e6)
##D d64 <- as.double(i32)
##D 
##D message("-- the following timings are rather conservative since timings
##D  of integer64 include garbage collection -- due to looped calls")
##D message("-- integer64 coerces 900x/100x faster than int64 
##D  under 64/32 bit OS (and 2x the time of coercing to integer) --")
##D t32 <- system.time(for(i in 1:1000)as.integer(d64))
##D t64 <- system.time(for(i in 1:1000)as.integer64(d64))
##D #T64 <- system.time(as.int64(d64))*1000
##D #T64/t64
##D t64/t32
##D td64 <- system.time(for(i in 1:1000)as.double(i32))
##D t64 <- system.time(for(i in 1:1000)as.integer64(i32))
##D #T64 <- system.time(for(i in 1:10)as.int64(i32))*100
##D #T64/t64
##D t64/td64
##D 
##D message("-- integer64 serializes 4x/0.8x faster than int64 
##D  under 64/32 bit OS (and less than 2x/6x the time of integer or double) --")
##D t32 <- system.time(for(i in 1:10)serialize(i32, NULL))
##D td64 <- system.time(for(i in 1:10)serialize(d64, NULL))
##D i64 <- as.integer64(i32); 
##D t64 <- system.time(for(i in 1:10)serialize(i64, NULL))
##D rm(i64); gc()
##D #I64 <- as.int64(i32); 
##D #T64 <- system.time(for(i in 1:10)serialize(I64, NULL))
##D #rm(I64); gc()
##D #T64/t64
##D t64/t32
##D t64/td64
##D 
##D 
##D message("-- integer64 adds 250x/60x faster than int64
##D  under 64/32 bit OS (and less than 6x the time of integer or double) --")
##D td64 <- system.time(for(i in 1:100)d64+d64)
##D t32 <- system.time(for(i in 1:100)i32+i32)
##D i64 <- as.integer64(i32); 
##D t64 <- system.time(for(i in 1:100)i64+i64)
##D rm(i64); gc()
##D #I64 <- as.int64(i32); 
##D #T64 <- system.time(for(i in 1:10)I64+I64)*10
##D #rm(I64); gc()
##D #T64/t64
##D t64/t32
##D t64/td64
##D 
##D message("-- integer64 sums 3x/0.2x faster than int64 
##D (and at about 5x/60X the time of integer and double) --")
##D td64 <- system.time(for(i in 1:100)sum(d64))
##D t32 <- system.time(for(i in 1:100)sum(i32))
##D i64 <- as.integer64(i32); 
##D t64 <- system.time(for(i in 1:100)sum(i64))
##D rm(i64); gc()
##D #I64 <- as.int64(i32); 
##D #T64 <- system.time(for(i in 1:100)sum(I64))
##D #rm(I64); gc()
##D #T64/t64
##D t64/t32
##D t64/td64
##D 
##D message("-- integer64 diffs 5x/0.85x faster than integer and double
##D (int64 version 1.0 does not support diff) --")
##D td64 <- system.time(for(i in 1:10)diff(d64, lag=2L, differences=2L))
##D t32 <- system.time(for(i in 1:10)diff(i32, lag=2L, differences=2L))
##D i64 <- as.integer64(i32); 
##D t64 <- system.time(for(i in 1:10)diff(i64, lag=2L, differences=2L))
##D rm(i64); gc()
##D t64/t32
##D t64/td64
##D 
##D 
##D message("-- integer64 subscripts 1000x/340x faster than int64
##D (and at the same speed / 10x slower as integer) --")
##D ts32 <- system.time(for(i in 1:1000)sample(1e6, 1e3))
##D t32<- system.time(for(i in 1:1000)i32[sample(1e6, 1e3)])
##D i64 <- as.integer64(i32); 
##D t64 <- system.time(for(i in 1:1000)i64[sample(1e6, 1e3)])
##D rm(i64); gc()
##D #I64 <- as.int64(i32); 
##D #T64 <- system.time(for(i in 1:100)I64[sample(1e6, 1e3)])*10
##D #rm(I64); gc()
##D #(T64-ts32)/(t64-ts32)
##D (t64-ts32)/(t32-ts32)
##D 
##D message("-- integer64 assigns 200x/90x faster than int64
##D (and 50x/160x slower than integer) --")
##D ts32 <- system.time(for(i in 1:100)sample(1e6, 1e3))
##D t32 <- system.time(for(i in 1:100)i32[sample(1e6, 1e3)] <- 1:1e3)
##D i64 <- as.integer64(i32); 
##D i64 <- system.time(for(i in 1:100)i64[sample(1e6, 1e3)] <- 1:1e3)
##D rm(i64); gc()
##D #I64 <- as.int64(i32); 
##D #I64 <- system.time(for(i in 1:10)I64[sample(1e6, 1e3)] <- 1:1e3)*10
##D #rm(I64); gc()
##D #(T64-ts32)/(t64-ts32)
##D (t64-ts32)/(t32-ts32)
##D 
##D 
##D tdfi32 <- system.time(dfi32 <- data.frame(a=i32, b=i32, c=i32))
##D tdfsi32 <- system.time(dfi32[1e6:1,])
##D fi32 <- tempfile()
##D tdfwi32 <- system.time(write.csv(dfi32, file=fi32, row.names=FALSE))
##D tdfri32 <- system.time(read.csv(fi32, colClasses=rep("integer", 3)))
##D unlink(fi32)
##D rm(dfi32); gc()
##D 
##D i64 <- as.integer64(i32); 
##D tdfi64 <- system.time(dfi64 <- data.frame(a=i64, b=i64, c=i64))
##D tdfsi64 <- system.time(dfi64[1e6:1,])
##D fi64 <- tempfile()
##D tdfwi64 <- system.time(write.csv(dfi64, file=fi64, row.names=FALSE))
##D tdfri64 <- system.time(read.csv(fi64, colClasses=rep("integer64", 3)))
##D unlink(fi64)
##D rm(i64, dfi64); gc()
##D 
##D #I64 <- as.int64(i32); 
##D #tdfI64 <- system.time(dfI64<-data.frame(a=I64, b=I64, c=I64))
##D #tdfsI64 <- system.time(dfI64[1e6:1,])
##D #fI64 <- tempfile()
##D #tdfwI64 <- system.time(write.csv(dfI64, file=fI64, row.names=FALSE))
##D #tdfrI64 <- system.time(read.csv(fI64, colClasses=rep("int64", 3)))
##D #unlink(fI64)
##D #rm(I64, dfI64); gc()
##D 
##D message("-- integer64 coerces 40x/6x faster to data.frame than int64
##D (and factor 1/9 slower than integer) --")
##D #tdfI64/tdfi64
##D tdfi64/tdfi32
##D message("-- integer64 subscripts from data.frame 20x/2.5x faster than int64
##D  (and 3x/13x slower than integer) --")
##D #tdfsI64/tdfsi64
##D tdfsi64/tdfsi32
##D message("-- integer64 csv writes about 2x/0.5x faster than int64
##D (and about 1.5x/5x slower than integer) --")
##D #tdfwI64/tdfwi64
##D tdfwi64/tdfwi32
##D message("-- integer64 csv reads about 3x/1.5 faster than int64
##D (and about 2x slower than integer) --")
##D #tdfrI64/tdfri64
##D tdfri64/tdfri32
##D 
##D rm(i32, d64); gc()
##D 
##D 
##D message("-- investigating the impact on garbage collection: --")
##D message("-- the fragmented structure of int64 messes up R's RAM --")
##D message("-- and slows down R's gargbage collection just by existing --")
##D 
##D td32 <- double(21)
##D td32[1] <- system.time(d64 <- double(1e7))[3]
##D for (i in 2:11)td32[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D rm(d64)
##D for (i in 12:21)td32[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D 
##D t64 <- double(21)
##D t64[1] <- system.time(i64 <- integer64(1e7))[3]
##D for (i in 2:11)t64[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D rm(i64)
##D for (i in 12:21)t64[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D 
##D #T64 <- double(21)
##D #T64[1] <- system.time(I64 <- int64(1e7))[3]
##D #for (i in 2:11)T64[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D #rm(I64)
##D #for (i in 12:21)T64[i] <- system.time(gc(), gcFirst=FALSE)[3]
##D 
##D #matplot(1:21, cbind(td32, t64, T64), pch=c("d","i","I"), log="y")
##D matplot(1:21, cbind(td32, t64), pch=c("d","i"), log="y")
##D   
## End(Not run)




