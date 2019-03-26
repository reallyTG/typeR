library(inplace)


### Name: inplace-sweep
### Title: Sweep
### Aliases: inplace-sweep sweep1_in_place sweep2_in_place

### ** Examples

x <- matrix(1:6, 2)
sweep(x, 2, 1:3)
x
sweep2_in_place(x, 1:3)
x




