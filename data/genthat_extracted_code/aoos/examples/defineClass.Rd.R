library(aoos)


### Name: defineClass
### Title: Define a new class
### Aliases: defineClass private private,public-method public
###   public,function-method public,private-method public,public-method

### ** Examples

test <- defineClass("test", {
  x <- "Working ..."
  .y <- 0
  doSomething <- public(function() {
    self$.y <- .y + 1
    cat(x(), "\n")
    invisible(self)
  })
})
instance <- test()
## Not run: 
##D instance$.y # error
## End(Not run)
instance$doSomething()$doSomething()
instance$x()
instance$x(2)
instance$x()

# Example for reference classes as field
MoreTesting <- defineClass("MoreTesting", {
  refObj <- test()
})
instance <- MoreTesting()
instance$refObj$x()



