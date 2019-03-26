library(pryr)


### Name: unenclose
### Title: Unenclose a closure.
### Aliases: unenclose

### ** Examples

power <- function(exp) {
  function(x) x ^ exp
}
square <- power(2)
cube <- power(3)

square
cube
unenclose(square)
unenclose(cube)



