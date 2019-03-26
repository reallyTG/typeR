library(oppr)


### Name: pproto
### Title: Create a new 'pproto' object
### Aliases: pproto

### ** Examples

Adder <- pproto("Adder",
  x = 0,
  add = function(self, n) {
    self$x <- self$x + n
    self$x
  }
)

Adder$add(10)
Adder$add(10)

Abacus <- pproto("Abacus", Adder,
  subtract = function(self, n) {
    self$x <- self$x - n
    self$x
  }
)
Abacus$add(10)
Abacus$subtract(10)




