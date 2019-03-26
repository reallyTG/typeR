library(spatstat.utils)


### Name: check.named.vector
### Title: Check Whether Object Has Required Components
### Aliases: check.named.vector check.named.list check.named.thing
### Keywords: error

### ** Examples

  z <- list(a=1, b=2, e=42)
  check.named.list(z, c("a", "b"), namopt=c("c", "d", "e"))
  check.named.thing(z, c("a", "b"), namopt=c("c", "d", "e"))
  zz <- unlist(z)
  check.named.vector(zz, c("a", "b"), namopt=c("c", "d", "e"))
  check.named.thing(z, c("b", "c"), namopt=c("d", "e"), fatal=FALSE)



