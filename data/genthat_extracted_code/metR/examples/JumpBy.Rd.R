library(metR)


### Name: JumpBy
### Title: Skip observations
### Aliases: JumpBy

### ** Examples

x <- 1:50
JumpBy(x, 2)   # only odd numbers
JumpBy(x, 2, start = 2)   # only even numbers
JumpBy(x, 2, fill = NA)   # even numbers replaced by NA
JumpBy(x, 2, fill = 6)   # even numbers replaced by 6




