library(splus2R)


### Name: nDotArgs
### Title: Determine Number of Arguments to Function
### Aliases: nDotArgs
### Keywords: utilities

### ** Examples

myfun <- function(..., a=4) nDotArgs(...)
myfun()                 ## returns 0 
myfun(1:3,"bear")       ## returns 2 
myfun(a=5, 1:3, "bear") ## returns 2 (excludes a)



