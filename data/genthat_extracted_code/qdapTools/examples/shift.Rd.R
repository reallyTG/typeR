library(qdapTools)


### Name: shift
### Title: Shift Vector Left/Right
### Aliases: shift shift_right shift_left
### Keywords: shift

### ** Examples

lapply(0:9, function(i) shift(1:10, i))
lapply(0:9, function(i) shift(1:10, i, "left"))

## Explicit, faster shifting
lapply(0:9, function(i) shift_right(1:10, i))
lapply(0:9, function(i) shift_left(1:10, i))
lapply(0:25, function(i) shift_left(LETTERS, i))



