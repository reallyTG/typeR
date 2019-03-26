library(ff)


### Name: as.hi
### Title: Hybrid Index, coercion to
### Aliases: as.hi as.hi.hi as.hi.ri as.hi.bit as.hi.bitwhich as.hi.call
###   as.hi.name as.hi.( as.hi.integer as.hi.which as.hi.double
###   as.hi.logical as.hi.character as.hi.matrix
### Keywords: IO data

### ** Examples

  message("integer indexing with and without rel-packing")
  as.hi(1:12)
  as.hi(1:12, pack=FALSE)
  message("if index is double, the wrapper method just converts to integer")
  as.hi(as.double(1:12))
  message("if index is character, the wrapper method just converts to integer")
  as.hi(c("a","b","c"), names=letters)
  message("negative index must use maxindex (or vw)")
  as.hi(-(1:3), maxindex=12)
  message("logical index can use maxindex")
  as.hi(c(FALSE, FALSE, TRUE, TRUE))
  as.hi(c(FALSE, FALSE, TRUE, TRUE), maxindex=12)

  message("matrix index")
  x <- matrix(1:12, 6)
  as.hi(rbind(c(1,1), c(1,2), c(2,1)), dim=dim(x))

  message("first ten positions within virtual window")
  i <- as.hi(1:10, vw=c(10, 80, 10))
  i
  message("back-coerce relativ to virtual window")
  as.integer(i)
  message("back-coerce relativ to absolute origin")
  as.integer(i, vw.convert=FALSE)

  message("parsed index expressions save index RAM")
    as.hi(quote(1:1000000000))
## Not run: 
##D   message("compare to RAM requirement when the index experssion is evaluated")
##D     as.hi(1:1000000000)
## End(Not run)

message("example of parsable index expression")
  a <- seq(100, 200, 20)
  as.hi(substitute(c(1:5, 4:9, a)))
  hi(c(1,4, 100),c(5,9, 200), by=c(1,1,20))

message("two examples of index expression temporarily expanded to full length due to 
non-supported use of brackets '(' and mathematical operators '+' accepting token")
message("example1: accepted token but aborted parsing because length>16")
  as.hi(quote(1+(1:16)))
message("example1: rejected token and aborted parsing because length>16")
  as.hi(quote(1+(1:17)))



