library(promises)


### Name: promise
### Title: Create a new promise object
### Aliases: promise

### ** Examples

# Create a promise that resolves to a random value after 2 secs
p1 <- promise(function(resolve, reject) {
  later::later(~resolve(runif(1)), delay = 2)
})

p1 %...>% print()

# Create a promise that errors immediately
p2 <- promise(~{
  reject("An error has occurred")
})
then(p2,
  onFulfilled = ~message("Success"),
  onRejected = ~message("Failure")
)




