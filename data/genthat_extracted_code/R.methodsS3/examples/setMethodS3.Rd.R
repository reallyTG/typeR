library(R.methodsS3)


### Name: setMethodS3
### Title: Creates an S3 method
### Aliases: setMethodS3.default setMethodS3
### Keywords: programming methods

### ** Examples

######################################################################
# Example 1
######################################################################
setMethodS3("foo", "default", function(x, ...) {
  cat("In default foo():\n");
  print(x, ...);
})


setMethodS3("foo", "character", function(s, ...) {
  cat("In foo() for class 'character':\n");
  print(s, ...);
})

# The generic function is automatically created!
print(foo)

foo(123)
foo("123")


######################################################################
# Example 2
#
# Assume that in a loaded package there is already a function bar(),
# but you also want to use the name 'bar' for the character string.
# It may even be the case that you do not know of the other package,
# but your users do!
######################################################################
# bar() in other package
bar <- function(x, y, ...) {
  cat("In bar() of 'other' package.\n");
}


# Your defintion; will redefine bar() above to bar.default().
setMethodS3("bar", "character", function(object, ...) {
  cat("In bar() for class 'character':\n");
  print(object, ...);
})

bar(123)
bar("123")





