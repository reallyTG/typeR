library(promises)


### Name: promise_resolve
### Title: Create a resolved or rejected promise
### Aliases: promise_resolve promise_reject

### ** Examples

promise_resolve(mtcars) %...>%
  head() %...>%
  print()

promise_reject("Something went wrong") %...T!%
  { message(conditionMessage(.)) }




