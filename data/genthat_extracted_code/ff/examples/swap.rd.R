library(ff)


### Name: swap
### Title: Reading and writing in one operation (high-level)
### Aliases: swap swap.ff swap.ff_array swap.default
### Keywords: IO data array

### ** Examples

  x <- ff("a", levels=letters, length=52)
  y <- swap(x, "b", sample(length(x), 26))
  x
  y
  rm(x,y); gc()



