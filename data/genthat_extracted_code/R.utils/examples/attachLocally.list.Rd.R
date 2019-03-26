library(R.utils)


### Name: attachLocally.list
### Title: Assigns an objects elements locally
### Aliases: attachLocally.list attachLocally.data.frame
###   attachLocally.environment attachLocally
### Keywords: methods utilities programming

### ** Examples

foo <- function(object) {
  cat("Local objects in foo():\n")
  print(ls())

  attachLocally(object)

  cat("\nLocal objects in foo():\n")
  print(ls())

  for (name in ls()) {
    cat("\nObject '", name, "':\n", sep="")
    print(get(name, inherits=FALSE))
  }
}

a <- "A string"
l <- list(a=1:10, msg="Hello world", df=data.frame(a=NA, b=2))
foo(l)
print(a)



