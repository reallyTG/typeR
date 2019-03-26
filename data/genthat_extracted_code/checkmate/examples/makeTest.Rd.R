library(checkmate)


### Name: makeTest
### Title: Turn a Check into a Test
### Aliases: makeTest makeTestFunction

### ** Examples

# Simple custom check function
checkFalse = function(x) if (!identical(x, FALSE)) "Must be FALSE" else TRUE

# Create the respective test function
testFalse = function(x) {
  res = checkFalse(x)
  makeTest(res)
}

# Alternative: Automatically create such a function
testFalse = makeTestFunction(checkFalse)
print(testFalse)



