library(promises)


### Name: promise_all
### Title: Combine multiple promise objects
### Aliases: promise_all promise_race

### ** Examples

p1 <- promise(~later::later(~resolve(1), delay = 1))
p2 <- promise(~later::later(~resolve(2), delay = 2))

# Resolves after 1 second, to the value: 1
promise_race(p1, p2) %...>% {
  cat("promise_race:\n")
  str(.)
}

# Resolves after 2 seconds, to the value: list(1, 2)
promise_all(p1, p2) %...>% {
  cat("promise_all:\n")
  str(.)
}




