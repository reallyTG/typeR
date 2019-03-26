library(pryr)


### Name: parenv
### Title: Get parent/ancestor environment
### Aliases: parenv

### ** Examples

adder <- function(x) function(y) x + y
add2 <- adder(2)
parenv(add2)



