library(later)


### Name: later
### Title: Executes a function later
### Aliases: later

### ** Examples

# Example of formula style
later(~cat("Hello from the past\n"), 3)

# Example of function style
later(function() {
  print(summary(cars))
}, 2)
  



