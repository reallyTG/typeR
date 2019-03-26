library(pracma)


### Name: mod, rem
### Title: Integer Division
### Aliases: mod rem idivide
### Keywords: arith

### ** Examples

mod(c(-5:5), 5)
rem(c(-5:5), 5)

idivide(c(-2, 2), 3, "fix")     #  0 0
idivide(c(-2, 2), 3, "floor")   # -1 0
idivide(c(-2, 2), 3, "ceil")    #  0 1
idivide(c(-2, 2), 3, "round")   # -1 1



