library(checkmate)


### Name: checkClass
### Title: Check the class membership of an argument
### Aliases: checkClass check_class assertClass assert_class testClass
###   test_class expect_class

### ** Examples

# Create an object with classes "foo" and "bar"
x = 1
class(x) = c("foo", "bar")

# is x of class "foo"?
testClass(x, "foo")

# is x of class "foo" and "bar"?
testClass(x, c("foo", "bar"))

# is x of class "foo" or "bar"?
## Not run: 
##D assert(
##D   checkClass(x, "foo"),
##D   checkClass(x, "bar")
##D )
## End(Not run)
# is x most specialized as "bar"?
testClass(x, "bar", ordered = TRUE)



