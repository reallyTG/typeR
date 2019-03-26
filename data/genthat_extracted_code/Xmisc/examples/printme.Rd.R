library(Xmisc)


### Name: printme
### Title: Print the name and the content of an R object
### Aliases: printme

### ** Examples

## print an object
x1 <- 1:6
printme(x1)

## print with a prefix
foo <- function(x,envir=sys.frame(sys.parent(0))){
  printme(x,match.call(),envir=envir)
  invisible()
}
foo(1:6)



