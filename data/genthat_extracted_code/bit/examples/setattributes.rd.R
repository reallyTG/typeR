library(bit)


### Name: setattributes
### Title: Attribute setting by reference
### Aliases: setattributes setattr
### Keywords: attributes

### ** Examples

  x <- as.single(runif(10))
  attr(x, "Csingle")

  f <- function(x)attr(x, "Csingle") <- NULL
  g <- function(x)setattr(x, "Csingle", NULL)

  f(x)
  x
  g(x)
  x

 ## Not run: 
##D 
##D   # restart R
##D   library(bit)
##D 
##D   mysingle <- function(length = 0){
##D     ret <- double(length)
##D     setattr(ret, "Csingle", TRUE)
##D     ret
##D   }
##D 
##D   # show that mysinge gives exactly the same result as single
##D   identical(single(10), mysingle(10))
##D 
##D   # look at the speedup and memory-savings of mysingle compared to single
##D   system.time(mysingle(1e7))
##D   memory.size(max=TRUE)
##D   system.time(single(1e7))
##D   memory.size(max=TRUE)
##D 
##D   # look at the memory limits
##D   # on my win32 machine the first line fails beause of not enough RAM, the second works
##D   x <- single(1e8)
##D   x <- mysingle(1e8)
##D 
##D   # .g. performance with factors
##D   x <- rep(factor(letters), length.out=1e7)
##D   x[1:10]
##D   # look how fast one can do this
##D   system.time(setattr(x, "levels", rev(letters)))
##D   x[1:10]
##D   # look at the performance loss in time caused by the non-needed copying
##D   system.time(levels(x) <- letters)
##D   x[1:10]
##D 
##D 
##D   # restart R
##D   library(bit)
##D 
##D   simplefactor <- function(n){
##D     factor(rep(1:2, length.out=n))
##D   }
##D 
##D   mysimplefactor <- function(n){
##D     ret <- rep(1:2, length.out=n)
##D     setattr(ret, "levels", as.character(1:2))
##D     setattr(ret, "class", "factor")
##D     ret
##D   }
##D 
##D   identical(simplefactor(10), mysimplefactor(10))
##D 
##D   system.time(x <- mysimplefactor(1e7))
##D   memory.size(max=TRUE)
##D   system.time(setattr(x, "levels", c("a","b")))
##D   memory.size(max=TRUE)
##D   x[1:4]
##D   memory.size(max=TRUE)
##D   rm(x)
##D   gc()
##D 
##D   system.time(x <- simplefactor(1e7))
##D   memory.size(max=TRUE)
##D   system.time(levels(x) <- c("x","y"))
##D   memory.size(max=TRUE)
##D   x[1:4]
##D   memory.size(max=TRUE)
##D   rm(x)
##D   gc()
##D 
## End(Not run)




