library(checkmate)


### Name: AssertCollection
### Title: Collect multiple assertions
### Aliases: AssertCollection makeAssertCollection reportAssertions

### ** Examples

x = "a"
coll = makeAssertCollection()

print(coll$isEmpty())
assertNumeric(x, add = coll)
coll$isEmpty()
coll$push("Custom error message")
coll$getMessages()
## Not run: 
##D   reportAssertions(coll)
## End(Not run)



